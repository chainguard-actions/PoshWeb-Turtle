param(
[double[]]
$viewBox
)

if ($viewBox.Length -gt 4) {
    $viewBox = $viewBox[0..3]
}
if ($viewBox.Length -lt 4) {
    if ($viewBox.Length -eq 3) {
        $viewBox = $viewBox[0], $viewBox[1], $viewBox[2],$viewBox[2]
    }
    if ($viewBox.Length -eq 2) {
        $viewBox = 0,0, $viewBox[0], $viewBox[1]
    }
    if ($viewBox.Length -eq 1) {
        $viewBox = 0,0, $viewBox[0], $viewBox[0]
    }
}

if ($viewBox[0] -eq 0 -and 
    $viewBox[1] -eq 0 -and 
    $viewBox[2] -eq 0 -and  
    $viewBox[3] -eq 0
) {
    $viewX = $this.Maximum.X + ($this.Minimum.X * -1)
    $viewY = $this.Maximum.Y + ($this.Minimum.Y * -1)
    $this.psobject.Properties.Remove('.ViewBox')
    return
}

$this | Add-Member -MemberType NoteProperty -Force -Name '.ViewBox' -Value $viewBox
