<#
.SYNOPSIS
    Sets text attributes
.DESCRIPTION
    Sets any attributes associated with the turtle text.

    These will become the attributes on the `<text>` element.
#>
param(
# The text attributes.
[Collections.IDictionary]
$TextAttribute = [Ordered]@{}
)

if (-not $this.'.TextAttribute') {
    $this | Add-Member -MemberType NoteProperty -Name '.TextAttribute' -Value ([Ordered]@{}) -Force
}
foreach ($key in $TextAttribute.Keys) {
    $this.'.TextAttribute'[$key] = $TextAttribute[$key]
}