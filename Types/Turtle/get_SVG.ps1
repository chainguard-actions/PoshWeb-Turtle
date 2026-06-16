param()
@(
"<svg xmlns='http://www.w3.org/2000/svg' viewBox='$($this.ViewBox)' transform-origin='50% 50%' width='100%' height='100%'>"
    $this.PathElement.OuterXml
    $this.TextElement.OuterXml    
"</svg>"
) -join '' -as [xml]