
<#
.SYNOPSIS
    Generates a Terdragon Curve.
.DESCRIPTION
    Generates a Terdragon curve using turtle graphics.
.LINK
    https://en.wikipedia.org/wiki/Dragon_curve#Terdragon
.EXAMPLE
    $turtle.TerdragonCurve().Pattern.Save("$pwd/TerdragonCurve.svg")
.EXAMPLE
    $turtle.Clear()
    $turtle.TerdragonCurve(20,7,90)
    $turtle.PatternTransform = @{
        'scale' = 0.9
        'rotate' = 45
    }
    
    $turtle.PatternAnimation = "
    <animateTransform attributeName='patternTransform' attributeType='XML' type='scale' values='1;0.9;1' dur='19s' repeatCount='indefinite' additive='sum' />
    <animateTransform attributeName='patternTransform' attributeType='XML' type='skewY' values='30;-30;30' dur='67s' repeatCount='indefinite' additive='sum' />
    <animateTransform attributeName='patternTransform' attributeType='XML' type='skewX' values='30;-30;30' dur='83s' repeatCount='indefinite' additive='sum' />
    "
    $turtle.Pattern.Save("$pwd/TerdragonCurve2.svg")
#>
param(
    [double]$Size = 20,
    [int]$Order = 8,
    [double]$Angle = 120
)
return $this.LSystem('F',  [Ordered]@{
    F = 'F+F-F'    
}, $Order, [Ordered]@{
    '\+'    = { $this.Rotate($Angle) }
    '-'     = { $this.Rotate($Angle * -1) }
    '[F]'  = { $this.Forward($Size) }
})
