param(
[Collections.IDictionary]
$SVGAttribute = [Ordered]@{}
)

if (-not $this.'.SVGAttribute') {
    $this | Add-Member -MemberType NoteProperty -Name '.SVGAttribute' -Value ([Ordered]@{}) -Force
}
foreach ($key in $SVGAttribute.Keys) {
    $this.'.SVGAttribute'[$key] = $SVGAttribute[$key]
}