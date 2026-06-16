<#
.SYNOPSIS
    Turns the turtle right 
.DESCRIPTION
    Turns the turtle right (clockwise) by the specified angle.
#>
param(
[double]$Angle = 90
)

$this.Rotate($Angle)