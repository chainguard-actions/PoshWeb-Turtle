param(
[Collections.IDictionary]
$PathAttribute = [Ordered]@{}
)

if (-not $this.'.PathAttribute') {
    $this | Add-Member -MemberType NoteProperty -Name '.PathAttribute' -Value ([Ordered]@{}) -Force
}
foreach ($key in $PathAttribute.Keys) {
    $this.'.PathAttribute'[$key] = $PathAttribute[$key]
}