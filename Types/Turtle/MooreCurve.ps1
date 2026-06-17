<#
.SYNOPSIS
    Generates a Moore curve.
.DESCRIPTION
    Generates a Moore curve using turtle graphics.
.LINK
    https://en.wikipedia.org/wiki/Moore_curve
.EXAMPLE
    $turtle = New-Turtle
    $turtle.MooreCurve().Pattern.Save("$pwd/MooreCurvePattern.svg")
.EXAMPLE
    Move-Turtle MooreCurve 15 5 |
        Set-Turtle Stroke '#4488ff' |
        Save-Turtle "./MooreCurve.svg"
#>
param(
    [double]$Size = 10,
    [int]$Order = 4,
    [double]$Angle = 90
)        


return $this.LSystem(
    'LFL+F+LFL', 
    [Ordered]@{ 
        L = '-RF+LFL+FR-'
        R = '+LF-RFR-FL+'
    },
    4, 
    @{
        F = { $this.Forward(10) }            
        '\+' = { $this.Rotate(90) }            
        '-' = { $this.Rotate(-90) }
    }
)
