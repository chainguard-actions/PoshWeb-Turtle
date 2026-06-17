<#
.SYNOPSIS
    Gets the turtle data URL.
.DESCRIPTION
    Gets the turtle symbol as a data URL.
    
    This can be used as an inline image in HTML, CSS, or Markdown.
#>
$thisSVG = $this.SVG
"data:image/svg+xml;base64,$(
    [Convert]::ToBase64String($OutputEncoding.GetBytes($this.SVG.outerXml))
)"