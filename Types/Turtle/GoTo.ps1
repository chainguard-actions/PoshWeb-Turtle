<#
.SYNOPSIS
    Go to a specific position.
.DESCRIPTION
    Moves the turtle to a specific position.  
    
    If the pen is down, it will draw a line to that position.
.EXAMPLE
    Move-Turtle GoTo 10 10 | Move-Turtle Square 10 10
#>
param(
# The X coordinate to move to.
[double]
$X,

# The Y coordinate to move to.
[double]
$Y
)

return $this.Step(
    $x - $this.X,
    $y - $this.Y
)