<#
.SYNOPSIS
    Draws a Fractal Shrub
.DESCRIPTION
    Draws a Fractal Shrub using an an L-System.

    This is a modification of the fractal plant will less rotation
.LINK
    https://en.wikipedia.org/wiki/L-system#Example_7:_fractal_plant
.EXAMPLE
    turtle FractalShrub save ./FractalShrub.svg
.EXAMPLE
    turtle FractalShrub morph  save ./FractalShrubMorph.svg
#>  
param(
    # The size of each segment
    [double]$Size = 42,
    # The order of magnitude (the number of times the L-system is expanded)
    [int]$Order = 4,
    # The angle of each segment
    [double]$Angle = -25
)
return $this.Rotate(-90).LSystem('-X',  [Ordered]@{
    'X' = 'F[[X]X]F[FX]X'
    'F' = 'FF'
}, $Order, [Ordered]@{
    'F'  = { $this.Forward($Size) }
    #'\+' = { $this.Rotate($angle)}
    # '\-' = { $this.Rotate($angle * -1)}
    '\[' = { $this.Push().Rotate($angle) }
    '\]' = { $this.Pop().Rotate($angle * -1) }
})