<#
.SYNOPSIS
    Sets the Start Vector for a Turtle
.DESCRIPTION
    Sets the starting vector for a Turtle.

    This avoids an automatic calculation of a starting position
.EXAMPLE
    turtle width 300 height 300 start 50 square 200
#>
param(
[PSObject]
$Value
)


$aNewStart = 
    if ($value -is [object[]] -and $value -as [float[]]) {
        [Numerics.Vector2]::new($value -as [float[]])
    } elseif ($value.GetType -and $value.GetType().IsPrimitive) {
        [Numerics.Vector2]::new($value,$value)
    } elseif ($value.X -and $value.Y) {
        [Numerics.Vector2]::new($value.X,$value.Y)
    }

if ($aNewStart) {
    $this | Add-Member NoteProperty '.Start' $aNewStart -Force
}



