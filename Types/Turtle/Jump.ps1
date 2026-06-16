<#
.SYNOPSIS
    Jumps the turtle forward by a specified distance
.DESCRIPTION
    Moves the turtle forward by the specified distance without drawing.

    Turtles may not be known for their jumping abilities, but they may surprise you!
.EXAMPLE
    $turtle.
        Clear().
        Rotate(45).
        Forward(10).
        Jump(20).
        Forward(10).        
        Symbol.Save("$pwd/Jump.svg")
#>
param(
# The distance to jump forward
[double]$Distance
)

$this.PenUp().Forward($Distance).PenDown()
