<#
.SYNOPSIS
    Draws a golden rectangle flower pattern.
.DESCRIPTION
    Draws a flower made out of golden rectangles.

    This pattern consists of a series of rectangles and rotations to create a flower-like design.
.EXAMPLE
    Turtle GoldenFlower
.EXAMPLE
    Turtle GoldenFlower 42 10 36
.EXAMPLE
    Turtle GoldenFlower 42 5 72
.EXAMPLE
    Turtle GoldenFlower 84 30 12 | Save-Turtle ./GoldenFlowerPattern.svg Pattern
#>
param(
    # The width of each rectangle
    [double]$Size = 42,
    # The rotation after each rectangle
    [double]$Rotation = 20,
    # The number of steps.
    [int]$StepCount = 18
)

$null = foreach ($n in 1..([Math]::Abs($StepCount))) {    
    $this.Rectangle($Size)
    $this.Rotate($Rotation)
}

return $this