<#
.SYNOPSIS
    Repeats Turtle Commands
.DESCRIPTION
    Repeats Turtle Commands any number of times.

    Repeat is the original loop statement in Turtle graphics.
.NOTES
    Repetition can be performed in many ways in PowerShell.

    Any example of repeat can also be written as an array with that series of steps, multiplied by the repeat count.

    ~~~PowerShell
    turtle repeat 3 [rotate 120 forward 42]
    # Produces the same shape as...
    turtle 'rotate',120,'forward',42 * 3
    # Produces the same shape as...
    turtle @(
        foreach ($n in 1..3) {
            'rotate', 120, 'forward', 42
        }
    )
    # Produces the same shape as...
    turtle @(
        foreach ($n in 1..3) {
            'rotate'
            120
            'forward'
            42
        }
    )
    ~~~

    Because repeat parses each step each time, repeat is likely to be one of the slower ways to repeat.
.EXAMPLE
    turtle repeat 3 [rotate (360/3) forward 42] save ./tri.svg
.EXAMPLE
    turtle repeat 6 [rotate (360/6) forward 42] save ./hex.svg
.EXAMPLE
    turtle repeat 7 [rotate (360/7) star 42 7] save ./starFlower.svg
.EXAMPLE
    turtle repeat 4 [rotate (360/4) forward 42 repeat 3 [rotate 120 forward 42]] save ./r.svg
.EXAMPLE
    turtle repeat 6 [rotate (360/6) forward 42 repeat 3 [rotate 120 forward 4.2]] save ./r2.svg
.EXAMPLE        
    turtle repeat 9 [rotate (
        360/9
    ) forward 84 repeat 6 [rotate (
        360/6
    ) forward 42 repeat 3 [rotate (
        360/3 
    ) forward 4.2]]] save ./r3.svg
#>
param(
# The repeat count.
# This will be rounded down to the nearest integer and converted into an absolute value.
[double]
$RepeatCount,

# The steps to repeat.
[Parameter(ValueFromRemainingArguments)]
[PSObject[]]
$Command
)

# If there was no repeat count, return this
if (-not $RepeatCount) {  return $this }
$floorCount  = [Math]::Abs([Math]::Floor($RepeatCount))

if ($floorCount -ge 1) {    
    $this = $this | turtle @($Command * $floorCount)
}
return $this