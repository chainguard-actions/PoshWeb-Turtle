param(
    $Size = 100, 
    $SideCount = 6
)

$null = foreach ($n in 1..$SideCount) {    
    $this.Forward($Size)
    $this.Rotate(360 / $SideCount)    
}
return $this