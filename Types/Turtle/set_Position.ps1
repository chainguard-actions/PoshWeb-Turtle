param([double[]]$xy)
$x, $y = $xy
if (-not $this.'.Position') {
    $this |  Add-Member -MemberType NoteProperty -Force -Name '.Position' -Value ([pscustomobject]@{ X = 0; Y = 0 })
}
$this.'.Position'.X += $x
$this.'.Position'.Y += $y
$posX, $posY = $this.'.Position'.X, $this.'.Position'.Y
if (-not $this.'.Minimum') {
    $this |  Add-Member -MemberType NoteProperty -Force -Name '.Minimum' -Value ([pscustomobject]@{ X = 0; Y = 0 })
}
if (-not $this.'.Maximum') {
    $this |  Add-Member -MemberType NoteProperty -Force -Name '.Maximum' -Value ([pscustomobject]@{ X = 0; Y = 0 })
}
if ($posX -lt $this.'.Minimum'.X) {
    $this.'.Minimum'.X = $posX
}
if ($posY -lt $this.'.Minimum'.Y) {
    $this.'.Minimum'.Y = $posY
}
if ($posX -gt $this.'.Maximum'.X) {
    $this.'.Maximum'.X = $posX
}
if ($posY -gt $this.'.Maximum'.Y) {
    $this.'.Maximum'.Y = $posY
}