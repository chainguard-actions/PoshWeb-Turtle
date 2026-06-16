if (-not $this.'.PathAttribute') {
    $this | Add-Member -MemberType NoteProperty -Name '.PathAttribute' -Value ([Ordered]@{}) -Force
}
if ($this.'.PathAttribute'.'fill-rule') {
    return $this.'.PathAttribute'.'fill-rule'
} else {
    'nonzero'
}