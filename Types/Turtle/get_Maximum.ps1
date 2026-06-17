<#
.SYNOPSIS
    Gets the turtle's highest point.
.DESCRIPTION
    Gets the maximum point vector visited by the turtle.

    This would the highest point that the turtle has been.
#>
[OutputType([Numerics.Vector2])]
param()
if (-not $this.'.Maximum') {
    $this | Add-Member NoteProperty '.Maximum' ([Numerics.Vector2]::new(0,0)) -Force
}

return $this.'.Maximum'
