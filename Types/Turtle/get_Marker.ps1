<#
.SYNOPSIS
    Gets the turtle as a Marker
.DESCRIPTION
    Gets the Turtle as a `<marker>`, which can mark points on another shape.
.EXAMPLE
    turtle viewbox 200 teleport 0 100 forward 100 markerEnd (
        turtle viewbox 10 rotate -90 polygon 10 3 fill context-fill stroke context-stroke
    ) strokewidth '3%' fill currentColor save ./marker.svg
.LINK
    https://developer.mozilla.org/en-US/docs/Web/SVG/Reference/Element/marker
#>
[OutputType([xml])]
param()

# The default settings for markers
$markerAttributes = [Ordered]@{
    id="$($this.id)-marker"
    viewBox="$($this.ViewBox)"
    orient='auto-start-reverse'
    refX=$this.Width/2
    refY=$this.Height/2
    markerWidth=5 
    marketHeight=5
}
# Marker attributes can exist in .Attribute or .SVGAttribute
$prefix = [Regex]::new('^/?marker/', 'IgnoreCase')
foreach ($collection in $this.Attribute, $this.SVGAttribute) {
    foreach ($key in $collection.Keys) {
        if ($key -notmatch $prefix) { continue }
        $markerAttributes[$key -replace $prefix] = $collection[$key]
    }
}

# Create a marker XML.
[xml]@(
    "<marker$(
    foreach ($key in $markerAttributes.Keys) {
        " $key='$($markerAttributes[$key])'"
    }
)>"
    $this.SVG.SVG.InnerXML
"</marker>"
)
