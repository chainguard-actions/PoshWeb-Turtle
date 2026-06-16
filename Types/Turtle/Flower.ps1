<#
.SYNOPSIS
    Draws a flower pattern.
.DESCRIPTION
    Draws a flower pattern in turtle graphics.

    This pattern consists of a series of polygons and rotations to create a flower-like design.
.EXAMPLE    
    turtle Flower 42
.EXAMPLE
    turtle Flower 42 20 6 18
.EXAMPLE
    turtle Flower 42 20 6 18
.EXAMPLE
    # We can make Flowers with partial polygons
    turtle Flower 42 20 6.6 18
.EXAMPLE
    # They are surprisingly beautiful     
    turtle Flower 42 30 7.7 12
#>
param(
    # The size of the base shape
    [double]$Size = 100,
    # The rotation after each step
    [double]$Rotation = 10,
    # The number of sides in each shape
    [double]$SideCount = 4,
    # The number of steps in the flower.
    [int]$StepCount = 36
)

$null = foreach ($n in 1..([Math]::Abs($StepCount))) {    
    $this.Polygon($Size, $SideCount)
    $this.Rotate($Rotation)
}

return $this