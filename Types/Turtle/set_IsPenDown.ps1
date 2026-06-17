param(
[bool]
$IsDown
)
if ($null -eq $this.'.IsPenDown') {
    $this | Add-Member -MemberType NoteProperty -Force -Name '.IsPenDown' -Value $IsDown
} else {
    $this.'.IsPenDown' = $IsDown
}
