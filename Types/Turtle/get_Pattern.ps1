<#
.SYNOPSIS
    Gets a Turtle Pattern
.DESCRIPTION
    Gets the current turtle as a pattern that stretches off to infinity.    
.EXAMPLE
    turtle star 42 4 | Save-Turtle "./GridPattern.svg"
.EXAMPLE
    turtle star 42 6 | Save-Turtle "./StarPattern6.svg"
.EXAMPLE
    turtle star 42 8 | Save-Turtle "./StarPattern8.svg"
.EXAMPLE
    turtle star 42 5 | Save-Turtle "./StarPattern5.svg"
.EXAMPLE
    turtle star 42 7 | Save-Turtle "./Star7Pattern.svg"
.EXAMPLE
    turtle viewbox 100 start 25 25 square 50 | Save-Turtle "./WindowPattern.svg" Pattern
.EXAMPLE
    turtle star 100 4 morph @(
        turtle star 100 4
        turtle rotate 90 star 100 4
        turtle rotate 180 star 100 4
        turtle rotate 270 star 100 4
        turtle star 100 4
    ) | Save-Turtle "./GridPatternMorph.svg"
.EXAMPLE
    turtle star 100 3 morph @(
        turtle star 100 3
        turtle rotate 90 star 100 3
        turtle rotate 180 star 100 3
        turtle rotate 270 star 100 3
        turtle star 100 3
    ) | Save-Turtle "./TriPatternMorph.svg"
.EXAMPLE
    turtle star 100 6 morph @(
        turtle star 100 6
        turtle rotate 90 star 100 6
        turtle rotate 180 star 100 6
        turtle rotate 270 star 100 6
        turtle star 100 6
    ) | Save-Turtle "./Star6PatternMorph.svg" | Show-Turtle
.EXAMPLE
    # We can use a pattern transform to scale the pattern
    turtle sierpinskiTriangle PatternTransform @{
        scale = 0.25
        rotate = 120
    } | 
        Save-Turtle "./SierpinskiTrianglePattern.svg" Pattern | 
        show-Turtle
.EXAMPLE
    # We can use pattern animations to change the pattern
    # Animations are relative to initial transforms
    turtle sierpinskiTriangle PatternTransform @{
        scale = 0.25
        rotate = 120
    } PatternAnimation ([Ordered]@{
        type = 'scale'    ; values = 1.33,0.66, 1.33 ; repeatCount = 'indefinite' ;dur = "23s"; additive = 'sum'
    }) | 
        Save-Turtle "./SierpinskiTrianglePattern.svg" Pattern | 
        Show-Turtle
.LINK
    https://developer.mozilla.org/en-US/docs/Web/SVG/Tutorials/SVG_from_scratch/Patterns
.LINK
    https://developer.mozilla.org/en-US/docs/Web/SVG/Reference/Element/pattern
#>
[OutputType([xml])]
param()

# Get our viewbox
$viewBox = $this.ViewBox
# and get the width and height
$viewX, $viewY, $viewWidth, $viewHeight = $viewBox

# Initialize our core attributes.
# These may be overwritten by user request.
$coreAttributes = [Ordered]@{
    'id'                = "$($this.ID)-pattern"
    'patternUnits'      = 'userSpaceOnUse'
    'x'                 = $viewX
    'y'                 = $viewY
    'width'             = $viewWidth
    'height'            = $viewHeight
    'transform-origin'  = '50% 50%'
}

# If we have specified any transforms
if ($this.PatternTransform) {    
    $coreAttributes."patternTransform" = 
        # Then generate a transform expression
        @(foreach ($key in $this.PatternTransform.Keys) {
            # transforms are a name, followed by parameters in paranthesis
            "$key($($this.PatternTransform[$key]))"
        }) -join ' '
}

# Pattern attributes can be defined within .SVGAttribute or .Attribute
# provided they have the appropriate prefix
$prefix = [Regex]::new('^/?pattern/', 'IgnoreCase')
# (slashes are invalid markup, and thus a fine way to target nested instances)

foreach ($collection in $this.SVGAttribute, $this.Attribute) {
    # If the connection does not exist, continue.
    if (-not $collection) { continue }
    # For each key that matches the prefix
    foreach ($key in $collection.Keys -match $prefix) {
        # add it to the attributes after stripping the prefix.
        $coreAttributes[$attributeName -replace $prefix] = $collection[$attributeName]
    }
}

$segments = @(
"<svg xmlns='http://www.w3.org/2000/svg' width='100%' height='100%'>"
"<defs>"
    "<pattern$(
    foreach ($attributeName in $coreAttributes.Keys) {
        " $attributeName='$($coreAttributes[$attributeName])'"
    }
)>"
        $(if ($this.PatternAnimation) { $this.PatternAnimation })
        $($this.SVG.SVG.InnerXML)
    "</pattern>"
"</defs>"
"<rect width='10000%' height='10000%' x='-5000%' y='-5000%' fill='url(#$($this.ID)-pattern)' transform-origin='50% 50%' />"
"</svg>"
) 

[xml]$segments