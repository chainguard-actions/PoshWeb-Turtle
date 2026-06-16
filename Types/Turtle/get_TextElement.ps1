
if ($this.Text) {
    return @(
        "<text id='$($this.ID)-text' $(
    foreach ($TextAttributeName in $this.TextAttribute.Keys) {
        " $TextAttributeName='$($this.TextAttribute[$TextAttributeName])'"
    }
)>"
            "<textPath href='#$($this.id)-path'>$([Security.SecurityElement]::Escape($this.Text))</textPath>"
            if ($this.TextAnimation) {$this.TextAnimation}
        "</text>"
    ) -as [xml]
}

