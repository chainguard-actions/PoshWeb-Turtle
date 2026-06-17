<#
.SYNOPSIS
    Gets a Turtle's animation motion
.DESCRIPTION
    Gets a Turtle's path as an animation motion.

    This only provides the animation path of this turtle, not any turtles contained within this turtle.
#>
[OutputType([xml])]
param()

[xml]@(
"<animateMotion dur='$(
    if ($this.Duration -is [TimeSpan]) {
        "$($this.Duration.TotalSeconds)s"
    } else {
        "$(($this.Points.Length / 2 / 10))s"
    }
)' repeatCount='indefinite' path='$($this.PathData)' />
")