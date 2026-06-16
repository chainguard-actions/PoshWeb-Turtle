<#
.SYNOPSIS
    Draws a Scissor
.DESCRIPTION
    Draws a Scissor in turtle.

    A Scissor is a pair of intersecting lines, drawn at an angle.
.EXAMPLE
    Turtle Scissor Save ./Scissor.svg
#>
param(
# The distance to travel
[double]
$Distance = 10,

# The interior angle of the scissors
[double]
$Angle = 60
)


$this.
    Rotate($angle). # Rotate 
    Forward($distance). # Move Forward
    Rotate($angle * -2). # Rotate Back
    Forward($Distance). # Move Forward
    Rotate($Angle) # Rotate
