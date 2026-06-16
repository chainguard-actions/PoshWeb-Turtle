param(
    [double]$Size = 20,
    [int]$Order = 4,
    [double]$Angle = 25
)
return $this.Rotate(-90).LSystem('-X',  [Ordered]@{
    'X' = 'F+[[X]-X]-F[-FX]+X'
    'F' = 'FF'    
}, $Order, [Ordered]@{
    'F'    = { $this.Forward($Size) }
    '\['      = { $this.Rotate($Angle * -1).Push() }
    '\]'      = { $this.Pop().Rotate($Angle) }
})

