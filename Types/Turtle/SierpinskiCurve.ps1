<#
.SYNOPSIS
    Generates a Sierpinski Curve.
.DESCRIPTION
    Generates a Sierpinski Curve using turtle graphics.
.LINK
    https://en.wikipedia.org/wiki/Sierpi%C5%84ski_curve#Representation_as_Lindenmayer_system
.EXAMPLE
    $turtle.SierpinskiCurve().Pattern.Save("$pwd/SierpinskiCurve.svg")
.EXAMPLE
    $turtle.Clear()
    $turtle.SierpinskiCurve(10,4)
    $turtle.PatternTransform = @{
        'scale' = 0.9        
    }    
    $turtle.PatternAnimation = "
    <animateTransform attributeName='patternTransform' attributeType='XML' type='scale' values='1;0.9;1' dur='19s' repeatCount='indefinite' additive='sum' />
    <animateTransform attributeName='patternTransform' attributeType='XML' type='skewY' values='0;-30;30;-30;0' dur='67s' repeatCount='indefinite' additive='sum' />
    <animateTransform attributeName='patternTransform' attributeType='XML' type='skewX' values='0;-30;30;-30;0' dur='83s' repeatCount='indefinite' additive='sum' />
    "
    $turtle.Pattern.Save("$pwd/SierpinskiCurve2.svg")
#>
param(
    [double]$Size = 20,
    [int]$Order = 4,
    [double]$Angle = 45
)
return $this.LSystem('F--XF--F--XF',  [Ordered]@{
    X ='XF+G+XF--F--XF+G+X'
}, $Order, [Ordered]@{
    '\+'    = { $this.Rotate($Angle) }
    '-'     = { $this.Rotate($Angle * -1) }
    '[FG]'  = { $this.Forward($Size) }
})
