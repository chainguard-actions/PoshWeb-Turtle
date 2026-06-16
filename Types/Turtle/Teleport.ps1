<#
.SYNOPSIS
    Teleports to a specific position.
.DESCRIPTION
    Teleports the turtle to a specific position.
.EXAMPLE
    Move-Turtle Teleport 5 5 | Move-Turtle Square 10
#>
param(
# The X coordinate to move to.
[double]
$X,

# The Y coordinate to move to.
[double]
$Y
)

$deltaX = $x - $this.X 
$deltaY = $y - $this.Y
$penState = $this.IsPenDown
$this.IsPenDown = $false
$null = $this.Step($deltaX, $deltaY)
$this.IsPenDown = $penState
return $this