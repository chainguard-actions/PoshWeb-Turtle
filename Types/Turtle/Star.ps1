<#
.SYNOPSIS
    Draws a star pattern
.DESCRIPTION
    Draws a star pattern with turtle graphics.
.EXAMPLE
    $turtle = New-Turtle
    $turtle.Star().Pattern.Save("$pwd/Star.svg")
.EXAMPLE
    Move-Turtle Star | Save-Turtle "./Star.svg"
#>
param(
    [double]$Size = 50,
    [int]$Points = 5
)
$Angle = 180 - (180 / $Points)
foreach ($n in 1..$Points) {
    $this.Forward($Size)
    $this.Rotate($Angle)
}
