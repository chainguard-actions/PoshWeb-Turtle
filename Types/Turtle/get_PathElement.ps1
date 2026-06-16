<#
.SYNOPSIS
    Gets the Turtle Path Element
.DESCRIPTION
    Gets the Path Element of a Turtle.

    This contains the path of the Turtle's motion.
#>

# Set our core attributes
$coreAttributes = [Ordered]@{
    id="$($this.id)-path"
    d="$($this.PathData)"
    stroke=
        if ($this.Stroke) { $this.Stroke } 
        else { 'currentColor' }
    'stroke-width'=
        if ($this.StrokeWidth) { $this.StrokeWidth } 
        else { '0.1%' }
    fill="$($this.Fill)"
    class=$($this.PathClass -join ' ')
    'transform-origin'='50% 50%' 
}
# If someone decides to override any of these attributes, they are welcome to (at their own aesthetic risk)
foreach ($pathAttributeName in $this.PathAttribute.Keys) {
    $coreAttributes[$pathAttributeName] = $($this.PathAttribute[$pathAttributeName])
}

@(
"<path$(
    foreach ($attributeName in $coreAttributes.Keys) {
        " $attributeName='$($coreAttributes[$attributeName])'"
    }
)>"
if ($this.PathAnimation) {$this.PathAnimation}
"</path>"
) -as [xml]