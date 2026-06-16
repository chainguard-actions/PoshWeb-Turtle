param(
    [double]$Size = 20,
    [int]$Order = 4,
    [double]$Angle = 45
)
return $this.Rotate(-90).LSystem('0',  [Ordered]@{
    '1' = '11'
    '0' = '1[0]0'    
}, $Order, [Ordered]@{
    '[01]'    = { $this.Forward($Size) }
    '\['      = { $this.Rotate($Angle * -1).Push() }
    '\]'      = { $this.Pop().Rotate($Angle) }
})

