<#
.SYNOPSIS
    Draws a Crystal Fractal
.DESCRIPTION
    Draws a Crystal Fractal, using an L-System
.LINK
    https://paulbourke.net/fractals/lsys/
.EXAMPLE
    turtle CrystalFractal 42 1
.EXAMPLE
    turtle CrystalFractal 42 2
.EXAMPLE
    turtle CrystalFractal 42 3
.EXAMPLE
    turtle CrystalFractal 42 4
#>
param(
# The size of each segment
[double]$Size = 200,
# The order of magnitude (the number of expansions)
[int]$Order = 4,
# The default angle.
[double]$Angle = 90
)
return $this.LSystem('F+F+F+F',  [Ordered]@{
    F = 'FF+F++F+F'
}, $Order, [Ordered]@{
    '\+'    = { $this.Rotate($Angle) }
    'F'     = { $this.Forward($Size) }
})
