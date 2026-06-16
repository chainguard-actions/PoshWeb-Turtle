<#
.SYNOPSIS
    Draws a star flower pattern.
.DESCRIPTION
    Draws a flower made out of stars.

    This pattern consists of a series of stars and rotations to create a flower-like design.
.EXAMPLE
    Turtle StarFlower
.EXAMPLE
    Turtle StarFlower 42 20 10
.EXAMPLE
    Turtle StarFlower 42 40 13 9
.EXAMPLE
    Turtle StarFlower 84 40 6 9 | Save-Turtle ./StarFlowerPattern.svg Pattern
#>
param(
    # The size of each star
    [double]$Size = 42,
    # The rotation after each star
    [double]$Rotation = 20,
    # The number of points in the star    
    [double]$PointCount = 6,
    # The number of steps.
    [int]$StepCount = 18
)

$null = foreach ($n in 1..([Math]::Abs($StepCount))) {    
    $this.Star($Size, $PointCount)
    $this.Rotate($Rotation)
}

return $this