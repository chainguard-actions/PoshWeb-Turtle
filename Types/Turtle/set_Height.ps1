<#
.SYNOPSIS
    Sets the turtle height
.DESCRIPTION
    Sets the Turtle viewbox height.
.NOTES
    Once set, it will no longer be automatically computed.
#>
param(
[double]
$height
)

$viewBox = $this.ViewBox
$this.ViewBox = $viewBox[0],$viewBox[1],$viewbox[-2], $height
