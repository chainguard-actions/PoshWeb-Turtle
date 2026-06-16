<#
.SYNOPSIS
    Draws a circle.
.DESCRIPTION
    Draws a whole or partial circle using turtle graphics.

    That is, it draws a circle by moving the turtle forward and rotating it.

    To draw a semicircle, use an extent of 0.5.

    To draw a quarter circle, use an extent of 0.25.

    To draw a half hexagon, use an extent of 0.5 and step count of 6.
.EXAMPLE
    $turtle = New-Turtle
    $turtle.Circle(10).Pattern.Save("$pwd/CirclePattern.svg")
.EXAMPLE
    Move-Turtle Circle 10 | 
        Save-Turtle "$pwd/CirclePattern.svg" -Property Pattern
.EXAMPLE
    $turtle = New-Turtle |    
        Move-Turtle Forward 10 |
        Move-Turtle Rotate -90 |
        Move-Turtle Circle 5 |        
        Move-Turtle Circle 5 .5 |
        Move-Turtle Rotate -90 | 
        Move-Turtle Forward 10 | Save-Turtle .\DashDotDash.svg
.EXAMPLE
    $turtle = New-Turtle |    
        Move-Turtle Forward 20 |
        Move-Turtle Circle 5 .75 |
        Move-Turtle Forward 20 |
        Move-Turtle Circle 5 .75 |
        Move-Turtle Forward 20 |
        Move-Turtle Circle 5 .75 |
        Move-Turtle Forward 20 |
        Move-Turtle Circle 5 .75 |
        Save-Turtle .\CommandSymbol.svg
#>
param(
[double]$Radius = 10,
[double]$Extent = 1,
[int]$StepCount = 180   
)

$circumference = 2 * [math]::PI * $Radius
$circumferenceStep = $circumference / $StepCount

if ($extent -eq 0) { return $this}

$extentMultiplier = if ($extent -gt 0) { 1 } else { -1 }

$currentExtent = 0
$maxExtent = [math]::Abs($extent)

$extentStep = 1/$StepCount

$null = foreach ($n in 1..$StepCount) {

    $this.Forward($circumferenceStep)
    $currentExtent += $extentStep

    if ($n -le $StepCount -and $currentExtent -le $maxExtent) {
        $this.Rotate( (360 / $StepCount) * $extentMultiplier)
    }

    if ($currentExtent -gt $maxExtent) {
        break
    }
}
return $this