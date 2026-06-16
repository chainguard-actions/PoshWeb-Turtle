<#
.SYNOPSIS
    Gets the turtle pattern data URL.
.DESCRIPTION
    Gets the turtle pattern as a data URL.
    
    This can be used as an inline image in HTML, CSS, or Markdown.
#>
$thisPattern = $this.Pattern
$b64 = [Convert]::ToBase64String($OutputEncoding.GetBytes($thisPattern.outerXml))
"data:image/svg+xml;base64,$b64"