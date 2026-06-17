<#
.EXAMPLE
    $turtle.Clear().GosperCurve().Pattern.Save("$pwd/GosperCurve.svg")
.EXAMPLE
    $turtle.Clear()
    $turtle.GosperCurve(20,1,60)
    $turtle.PatternTransform = @{
        'scale' = 0.5
    }
    
    $turtle.PatternAnimation = "
    <animateTransform attributeName='patternTransform' attributeType='XML' type='scale' values='1;0.9;1' dur='19s' repeatCount='indefinite' additive='sum' />
    <animateTransform attributeName='patternTransform' attributeType='XML' type='skewY' values='30;-30;30' dur='67s' repeatCount='indefinite' additive='sum' />
    <animateTransform attributeName='patternTransform' attributeType='XML' type='skewX' values='30;-30;30' dur='83s' repeatCount='indefinite' additive='sum' />
    "
    $turtle.Pattern.Save("$pwd/GosperCurve2.svg")
#>
param(
    [double]$Size = 10,
    [int]$Order = 4,
    [double]$Angle = 60
)        

return $this.LSystem('A',  @{
    A = 'A-B--B+A++AA+B-'
    B = 'A-BB--B-A++A+B'
}, $Order, ([Ordered]@{
    '\+'    = { $this.Rotate($Angle) }
    '[AB]'  = { $this.Forward($Size) }    
    '-'     = { $this.Rotate($Angle * -1) }
}))
