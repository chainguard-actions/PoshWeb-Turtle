<#
.SYNOPSIS
    Gets the turtle opacity
.DESCRIPTION
    Gets the opacity of the turtle path.
#>
if (-not $this.'.PathAttribute') {
    $this | Add-Member -MemberType NoteProperty -Name '.PathAttribute' -Value ([Ordered]@{}) -Force
}
if ($this.'.PathAttribute'.'opacity') {
    return $this.'.PathAttribute'.'opacity'
} else {
    return 1.0
}