param(
[Collections.IDictionary]
$PatternTransform
)

$this | Add-Member -MemberType NoteProperty -Force -Name '.PatternTransform' -Value $PatternTransform