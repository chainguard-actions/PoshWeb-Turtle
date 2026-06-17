<#
.SYNOPSIS
    Draws a step spiral
.DESCRIPTION
    Draws a spiral as a series of steps.

    Each step will draw a line, rotate, and increment the length of the next step.

    By default, this creates an outward spiral.

    To create an inward spiral, use a negative StepSize or StepCount.
.EXAMPLE
    turtle StepSpiral save ./StepSpiral.svg
.EXAMPLE
    turtle @('StepSpiral',3, 120, 'rotate',120 * 3) save ./StepSpiralx3.svg
.EXAMPLE
    turtle @('StepSpiral',3, 90, 'rotate',90 * 3) save ./StepSpiralx4.svg
#>
param(
# The length of the first step
[double]$Length = 1,
# The angle to rotate after each step
[double]$Angle = 90,
# The amount of change per step
[double]$StepSize = 1,
# The number of steps.
[int]$StepCount = 20
)

# If the step size or count is negative
if (
    ($stepSize -lt 0 -or $stepCount -lt 0) -and
    $Length -in 0,1 # and the length is either the default or zero
) {
    # set the length to the correct maximim step size, so we can make an inward spiral.
    $Length = ([Math]::Abs($stepSize) * [Math]::Abs($stepCount))
} 
elseif ($length -eq 0) {
    # If the length is empty, default it to the step size
    $Length = $StepSize
}

# Perform the appropriate steps
foreach ($n in 1..([Math]::Abs($StepCount))) {
    $this = $this.Forward($length).Rotate($angle)
    $length += $stepSize    
}
# and return ourself.
return $this

