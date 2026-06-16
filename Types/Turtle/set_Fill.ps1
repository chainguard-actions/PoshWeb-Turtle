param(
    [string]$Fill = 'transparent'
)

if (-not $this.'.Fill') {
    $this | Add-Member -MemberType NoteProperty -Name '.Fill' -Value $Fill -Force
} else {
    $this.'.Fill' = $Fill
}