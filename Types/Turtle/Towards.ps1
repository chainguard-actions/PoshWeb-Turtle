<#
.SYNOPSIS
    Determines the angle towards a point
.DESCRIPTION
    Determines the angle from the turtle's current heading towards a point.
#>
param(
# The X-coordinate
[double]$X = 0,
# The Y-coordinate
[double]$Y = 0
)

# Determine the delta from the turtle's current position to the specified point
$deltaX = $X - $this.Position.X 
$deltaY = $Y - $this.Position.Y
# Calculate the angle in radians and convert to degrees
$angle = [Math]::Atan2($deltaY, $deltaX) * 180 / [Math]::PI
# Return the angle minus the current heading (modulo 360)
return $angle - ($this.Heading % 360)
