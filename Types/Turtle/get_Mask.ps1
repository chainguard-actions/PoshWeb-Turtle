<#
.SYNOPSIS
    Gets a Turtle's mask
.DESCRIPTION
    Gets a Turtle as an image mask.

    Everything under a white pixel will be visible.

    Everything under a black pixel will be invisible.
.EXAMPLE
    # Masks will autoscale to the object bounding box by default
    # Make sure to leave a hole.
    turtle defines @( 
        turtle id smallsquare width 84 height 84 @(
        ) teleport 21 21 square 42 @(
        ) fill black backgroundcolor white mask 
    ) square 84 fill '#4488ff' stroke '#224488' pathattribute @{
        mask='url(#smallsquare-mask)'
    } save ./square-mask.svg
.EXAMPLE
    # Masks can contain morphing
    turtle defines @( 
        turtle id smallsquare viewbox 84 @(
            'fill','black'
            'backgroundcolor','white'
        ) morph @(
            turtle teleport 21 21 square 42
            turtle teleport 41.5 41.5 square 1
            turtle teleport 21 21 square 42
        ) duration '00:00:01.68' mask 
    ) square 840 fill '#050506ff' stroke '#224488' pathattribute @{
        mask='url(#smallsquare-mask)'
    } save ./square-mask-morph.svg
.LINK
    https://developer.mozilla.org/en-US/docs/Web/SVG/Reference/Element/mask
#>
[OutputType([xml])]
param()

$keyPattern = '^mask/'
$defaultId  = "$($this.Id)-mask" 
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
    $this.SVG.OuterXml -replace '\<\?[^\>]+\>'
"</mask>"
)
# join them and cast to XML.
[xml]($segments -join '')