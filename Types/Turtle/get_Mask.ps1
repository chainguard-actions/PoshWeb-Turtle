$segments = @(
"<svg xmlns='http://www.w3.org/2000/svg' width='0%' height='0%'>"
    "<defs>"
        "<mask id='$($this.Id)-mask'>"
            $this.Symbol.OuterXml -replace '\<\?[^\>]+\>'
        "</mask>"
    "</defs>"
"</svg>"
)
[xml]($segments -join '')