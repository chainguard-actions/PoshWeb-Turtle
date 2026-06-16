param(
    [double]$Size = 10,
    [int]$Order = 5,
    [double]$Angle = 90
)        

return $this.LSystem('A',  [Ordered]@{
    A = '+BF-AFA-FB+'
    B = '-AF+BFB+FA-'
}, $Order, [Ordered]@{
    'F'     = { $this.Forward($Size) }
    '\+'    = { $this.Rotate($Angle) }
    '\-'    = { $this.Rotate($Angle * -1) }
})
