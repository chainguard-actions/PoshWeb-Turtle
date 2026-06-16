<#
.SYNOPSIS
    Generates a Peano curve.
.DESCRIPTION
    Generates a Peano curve using turtle graphics.
.LINK
    https://en.wikipedia.org/wiki/Peano_curve
.EXAMPLE
    $turtle = New-Turtle
    $turtle.PeanoCurve().Pattern.Save("$pwd/PeanoCurve.svg")
.EXAMPLE
    Move-Turtle PeanoCurve 15 5 |
        Set-Turtle Stroke '#4488ff' |
        Save-Turtle "./PeanoCurve.svg"
#>
param(
    [double]$Size = 10,
    [int]$Order = 5,
    [double]$Angle = 90
)        

return $this.LSystem('X',  @{
    X = 'XFYFX+F+YFXFY-F-XFYFX'
    Y = 'YFXFY-F-XFYFX+F+YFXFY'
}, $Order, ([Ordered]@{
    '\+'    = { $this.Rotate($Angle) }
    '[F]'   = { $this.Forward($Size) }    
    '\-'    = { $this.Rotate($Angle * -1) }
}))
