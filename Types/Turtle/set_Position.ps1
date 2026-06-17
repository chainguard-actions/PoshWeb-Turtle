<#
.SYNOPSIS
    Sets the Turtle's position
.DESCRIPTION
    Sets the position of the Turtle and updates its minimum and maximum.
    
    This should really not be done directly - the position should be updated as the Turtle moves.
.NOTES
    Changing the position outside of the turtle will probably not work how you would expect.
#>
param([double[]]$xy)
# break apart the components
$x, $y = $xy
# and add a position if we do not have one.
if (-not $this.'.Position') {
    $this |  Add-Member -MemberType NoteProperty -Force -Name '.Position' -Value ([Numerics.Vector2]@{ X = 0; Y = 0 })
}

# Modify the position without creating a new object
$this.'.Position'.X += $x
$this.'.Position'.Y += $y
# And readback our new position
$posX, $posY = $this.'.Position'.X, $this.'.Position'.Y
# If we have no .Minimum
if (-not $this.'.Minimum') {
    # create one.
    $this |  Add-Member -MemberType NoteProperty -Force -Name '.Minimum' -Value ([Numerics.Vector2]@{ X = 0; Y = 0 })
}

# Then check if we need to update our minimum point.
if ($posX -lt $this.'.Minimum'.X) {
    $this.'.Minimum'.X = $posX
}
if ($posY -lt $this.'.Minimum'.Y) {
    $this.'.Minimum'.Y = $posY
}

# If we have no .Maximum
if (-not $this.'.Maximum') {
    # create one.
    $this |  Add-Member -MemberType NoteProperty -Force -Name '.Maximum' -Value ([Numerics.Vector2]@{ X = 0; Y = 0 })
}

# Then update our maximum point
if ($posX -gt $this.'.Maximum'.X) {
    $this.'.Maximum'.X = $posX
}
if ($posY -gt $this.'.Maximum'.Y) {
    $this.'.Maximum'.Y = $posY
}