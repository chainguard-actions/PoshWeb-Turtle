<#
.SYNOPSIS
    Draws a flower pattern.
.DESCRIPTION
    Draws a flower pattern in turtle graphics.

    This pattern consists of a series of polygons and rotations to create a flower-like design.
.EXAMPLE
    $turtle = New-Turtle
    $turtle.Flower(100, 10, 5, 36)
    $turtle.Pattern.Save("$pwd/FlowerPattern.svg")
.EXAMPLE
    Move-Turtle Flower |
        Save-Turtle ./FlowerSymbol.svg
#>
param(
    [double]$Size = 100,
    [double]$Rotation = 10,
    [double]$SideCount = 4,
    [double]$StepCount = 36
)

$null = foreach ($n in 1..$StepCount) {    
    $this.Polygon($Size, $SideCount)
    $this.Rotate($Rotation)
}

return $this