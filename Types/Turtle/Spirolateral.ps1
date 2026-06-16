<#
.SYNOPSIS
    Draws a spirolateral
.DESCRIPTION
    Draws a spirolateral
.LINK
    https://en.wikipedia.org/wiki/Spirolateral
.EXAMPLE
    turtle spirolateral save ./Spirolateral.svg
.EXAMPLE
    turtle spirolateral 50 144 8 save ./Spirolateral-144-8.svg
.EXAMPLE
    turtle spirolateral 50 60 10 save ./Spirolateral-60-10.svg
.EXAMPLE
    turtle spirolateral 50 120 6 @(1,3) save ./Spirolateral-120-6-1_3.svg
.EXAMPLE
    turtle spirolateral 50 90 11 @(3,4,5) save ./Spirolateral-90-11-3_4_5.svg
.EXAMPLE
    turtle @('spirolateral',50,60,6,@(1,3),'rotate', 60 * 6 ) save ./Spirolateral-x6.svg
#>
param(
# The base length of each side (this will be multiplied by the step number)
[double]
$Side = 10,

# The angle of the turn
[double]
$Angle = 90,

# The step count.
# This is the number of times the steps will be repeated.
# This is also the maximum number of iterations the shape will complete.
[int]
$StepCount = 10,

# The step numbers that are left turns (counter-clockwise).
# This allows the creation of general spirolaterals
[Parameter(ValueFromRemainingArguments)]
[int[]]
$LeftTurnSteps
)

$stepNumber = 1
$majorStepCount = 0
$totalTurn = 0
do {
    $null = for ($stepNumber = 1; $stepNumber -le [Math]::Abs($StepCount); $stepNumber++) {
        $null = $this.Forward($side * $stepNumber)
        if ($LeftTurnSteps) {
            if ($LeftTurnSteps -contains $stepNumber) {
                $totalTurn -= $angle
                $this.Left($angle)
            } else {
                $totalTurn += $angle
                $this.Right($angle)
            }
        } else {
            $totalTurn += $angle
            $this.Right($angle)
        }
    }
    $majorStepCount++
} until (
    (-not ([Math]::Round($totalTurn, 5) % 360 )) -and 
    $majorStepCount -le [Math]::Abs($StepCount)
)

return $this
