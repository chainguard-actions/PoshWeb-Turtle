<#
.SYNOPSIS
    Arcs the turtle to the right
.DESCRIPTION
    Arcs the turtle to the right (clockwise) a number of degrees.

    For each degree, the turtle will move forward and rotate.
.NOTES
    The amount moved forward will be the portion of the circumference.
#>
param(
# The radius of a the circle, were it to complete the arc.
[double]
$Radius = 10,

# The angle of the arc
[double]
$Angle = 60
)

# Determine the absolute angle, for this operation
$absAngle = [Math]::Abs($angle)

if ($absAngle -eq 0) { return $this }

# Determine the circumference of a circle of this radius
$Circumference = ((2 * $Radius) * [Math]::PI)

# Clamp the angle, as arcs beyond 360 just continue to circle
$ClampedAngle = 
    if ($absAngle -gt 360) { 360 }
    elseif ($absAngle -lt -360) { -360}
    else { $absAngle }
# The circumference step is the circumference divided by our clamped angle
$CircumferenceStep = $Circumference / [Math]::Floor($ClampedAngle)
# The iteration is as close to one or negative one as possible
$iteration  = $angle / [Math]::Floor($absAngle)
# Start off at iteration 1
$angleDelta = $iteration
# while we have not reached the angle
while ([Math]::Abs($angleDelta) -le $absAngle) {
    # Rotate and move forward
    $null = $this.Rotate($iteration).Forward($CircumferenceStep)
    $angleDelta+=$iteration
}

# Return this so we can keep the chain.
return $this