<#
.SYNOPSIS
    Gets the Turtle's position
.DESCRIPTION
    Gets the current position of the turtle as a vector.
#>
[OutputType([Numerics.Vector2])]
param()
if (-not $this.'.Position') {
    $this |  Add-Member -MemberType NoteProperty -Force -Name '.Position' -Value (
        [Numerics.Vector2]::new(0,0)
    )
}
return $this.'.Position'
