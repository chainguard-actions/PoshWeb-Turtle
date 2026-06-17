<#
.SYNOPSIS
    Sets a Turtle's opacity
.DESCRIPTION
    Sets the opacity of a Turtle
.EXAMPLE
    turtle opacity .5 opacity
#>
param(
[double]
$Opacity
)
$this | Add-Member NoteProperty '.Opacity' $Opacity -Force
