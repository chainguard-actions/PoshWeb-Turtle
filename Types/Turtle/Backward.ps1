<#
.SYNOPSIS
    Moves backwards
.DESCRIPTION
    Moves the turtle backwards by a specified distance.
.EXAMPLE
    Move-Turtle Forward 10 | 
        Move-Turtle Backward 5 | 
        Move-Turtle Rotate 90 | 
        Move-Turtle Forward 20 | 
        Save-Turtle ./DrawT.svg
#>
param(
# The distance to move backwards
[double]
$Distance = 10
)

$this.Forward($Distance * -1)
