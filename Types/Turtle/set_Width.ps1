<#
.SYNOPSIS
    Sets the turtle width
.DESCRIPTION
    Sets the Turtle viewbox width.
.NOTES
    Once set, it will no longer be automatically computed.
#>
param(
# The new viewbox width.
[double]
$Width
)

$viewBox = $this.ViewBox
$this.ViewBox = $viewBox[0],$viewBox[1],$width, $viewBox[-1]
