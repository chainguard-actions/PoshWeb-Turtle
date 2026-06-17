<#
.SYNOPSIS
    Draws a Sun
.DESCRIPTION
    Draws a Sun in Turtle.

    Suns are drawn by drawing a ArcRight and ArcLeft, followed by a rotation.
.EXAMPLE
    turtle Sun save ./Sun.svg
.EXAMPLE
    turtle Sun 100 90 90 4 save ./Sun-120-4.svg
.EXAMPLE
    turtle Sun 100 (360/7) (7/360) 7
.EXAMPLE
    turtle Sun 100 135 90 8 save ./Sun-135-8.svg
.EXAMPLE
    turtle Sun 100 135 90 8 fill 'yellow' 'goldenrod' save ./Sun-135-90-8-gradient.svg
.EXAMPLE
    turtle Sun 100 135 60 8 fill 'yellow' 'goldenrod' stroke 'goldenrod' 'yellow' save ./Sun-135-90-8-gradient-mix.svg
.EXAMPLE
    turtle Sun 100 135 60 8 fill 'yellow' 'goldenrod' stroke 'goldenrod' 'yellow' morph @(
        turtle Sun 100 135 60 8
        turtle Sun 100 135 -60 8
        turtle Sun 100 135 60 8
    ) save ./Sun-135-60-8-gradient-mix.svg
.EXAMPLE
    turtle Sun 100 160 90 18 fill 'yellow' 'goldenrod' stroke 'goldenrod' 'yellow' morph @(
        turtle Sun 100 160 90 18
        turtle Sun 100 160 -90 18
        turtle Sun 100 160 90 18
    ) save ./Sun-160-90-18-gradient-mix.svg
.EXAMPLE
    turtle Sun 100 150 -90 12 save ./Sun-150-12.svg
.EXAMPLE
    turtle Sun 100 160 -90 9 save ./Sun2.svg
.EXAMPLE
    turtle Sun 100 120 36 3 fill 'yellow' 'goldenrod' fillrule evenodd save ./Sun-230-36-EvenOdd.svg
.EXAMPLE
    turtle Sun 100 230 36 fill '#4488ff' fillrule evenodd save ./Sun-230-36-EvenOdd.svg
.EXAMPLE
    turtle Sun 100 160 -100 9 morph @(
        turtle Sun 100 160 -100 9
        turtle Sun 100 160 100 9
        turtle Sun 100 160 -100 9
    )
#>
param(
# The length of both arcs
[double]
$Length = 42,

# The rotation after each step
[double]
$Angle = 160,

# The angle of the rays of the sun
[double]
$RayAngle = 90,

# The number of steps to draw.
# In order to close the shape, this multiplied by the angle should be a multiple of 360.
[int]
$StepCount = 9
)

# If there are no steps to draw, return this
if ($stepCount -eq 0) { return $this }

# Every step we take
$null = foreach ($n in 1..([Math]::Abs($StepCount))) {    
    $this.
        # arc right
        ArcRight($length/2, $RayAngle).
        # then arc left
        ArcLeft($length/2, $RayAngle).
        # then rotate.
        Rotate($Angle)    
}

# Return this so we never break the chain.
return $this
