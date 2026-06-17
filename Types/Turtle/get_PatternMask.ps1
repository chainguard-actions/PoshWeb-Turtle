<#
.SYNOPSIS
    Gets a Turtle's Pattern Mask
.DESCRIPTION
    Gets the current turtle as a pattern mask.
    
    Everything under a white pixel will be visible.

    Everything under a black pixel will be invisible.
    
    This will be a mask of the turtle's `.Pattern` property, and will repeat the turtle's `.SVG` multiple times.
.EXAMPLE
    # Masks will autoscale to the object bounding box by default
    # Make sure to leave a hole.
    turtle defines @( 
        turtle id smallsquare viewbox 84 teleport 21 21 square 42 @(
            'fill','black'
            'backgroundcolor','white'
        ) patternmask 
    ) square 840 fill '#4488ff' stroke '#224488' pathattribute @{
        mask='url(#smallsquare-pattern-mask)'
    } save ./square-pattern-mask.svg
.EXAMPLE
    # Masks can contain morphing
    turtle defines @( 
        turtle id smallsquare viewbox 84 @(
            'fill','black'
            'backgroundcolor','white'
        ) morph @(
            turtle teleport 21 21 square 42
            turtle teleport 42 42 square 1
            turtle teleport 21 21 square 42
        ) duration '00:00:01.68' patternmask 
    ) square 840 fill '#4488ff' stroke '#224488' pathattribute @{
        mask='url(#smallsquare-pattern-mask)'
    } save ./square-pattern-mask-morph.svg
.LINK
    https://developer.mozilla.org/en-US/docs/Web/SVG/Reference/Element/mask
#>
[OutputType([xml])]
param()
$keyPattern = '^pattern-?mask/'
$defaultId  = "$($this.Id)-pattern-mask" 
# Gather the mask attributes, and default the ID (the only attribute we actually need)
$maskAttributes = [Ordered]@{id=$defaultId}
# Attributes can exist in .SVGAttribute or .Attribute
foreach ($collectionName in 'SVGAttribute','Attribute') {
    # as long as they start with mask/
    # (slashes are not valid attribute names, so this can denote a target name or type)
    foreach ($key in $this.$collectionName.Keys -match $keyPattern) {
        $maskAttributes[$key -replace $keyPattern] = $this.$collectionName[$key]
    }
}

# Create an attribute declaration
$maskAttributes = @(foreach ($attributeName in $maskAttributes.Keys) {
    "$($attributeName)='$(
        [Web.HttpUtility]::HtmlAttributeEncode($maskAttributes[$attributeName])
    )'"
}) -join ' '

# Declare the mask segments
$segments = @(
"<mask $maskAttributes>"
    $this.Pattern.OuterXml -replace '\<\?[^\>]+\>'
"</mask>"
)
# join them and cast to XML.
[xml]$segments