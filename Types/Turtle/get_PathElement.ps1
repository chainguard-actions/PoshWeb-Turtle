@(
"<path id='$($this.id)-path' d='$($this.PathData)' stroke='$(
    if ($this.Stroke) { $this.Stroke } else { 'currentColor' }
)' stroke-width='$(
    if ($this.StrokeWidth) { $this.StrokeWidth } else { '0.1%' }
)' fill='$($this.Fill)' class='$(
    $this.PathClass -join ' '
)' transform-origin='50% 50%' $(
    foreach ($pathAttributeName in $this.PathAttribute.Keys) {
        " $pathAttributeName='$($this.PathAttribute[$pathAttributeName])'"
    }
)>"
if ($this.PathAnimation) {$this.PathAnimation}
"</path>"
) -as [xml]