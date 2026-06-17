<#
.SYNOPSIS
    Draws a Levy Curve
.DESCRIPTION
    Draws a Levy Curve L-System
.LINK
    https://paulbourke.net/fractals/lsys/
#>
param(
# The size of each segment.
[double]$Size = 10,
# The number of expansions (the order of magnitude)
[int]$Order = 4,
# The angle
[double]$Angle = 45
)

$this.LSystem('F', @{
    F='-F++F-'
}, $Order, [Ordered]@{
    '\+' = { $this.Rotate($angle)}
    '-' = { $this.Rotate($angle * -1)}
    'F' = { $this.Forward($size)}
})

