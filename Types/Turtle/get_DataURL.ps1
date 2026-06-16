<#
.SYNOPSIS
    Gets the turtle data URL.
.DESCRIPTION
    Gets the turtle symbol as a data URL.
    
    This can be used as an inline image in HTML, CSS, or Markdown.
#>
$thisSymbol = $this.Symbol
$b64 = [Convert]::ToBase64String($OutputEncoding.GetBytes($thisSymbol.outerXml))
"data:image/svg+xml;base64,$b64"