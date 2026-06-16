param([double]$Size = 50)
$null = foreach ($n in 1..4) {
    $this.Forward($Size)
    $this.Rotate(90)
}
return $this