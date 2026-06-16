<#
.SYNOPSIS
    Turns the turtle left
.DESCRIPTION
    Turns the turtle left (counter-clockwise) by the specified angle.
#>
param(
[double]$Angle = 90
)

$this.Rotate($Angle * -1)