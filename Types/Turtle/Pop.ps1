<#
.SYNOPSIS
    Pops the Turtle Stack
.DESCRIPTION
    Pops the Turtle back to the last location and heading in the stack.    

    By pushing and popping, we can draw multiple branches.
.EXAMPLE
    # Draws a T shape by pushing and popping
    turtle rotate -90 forward 42 push rotate 90 forward 21 pop rotate -90 forward 21 show
#>
param()

# If the stack is not a stack, return ourself
if ($this.'.Stack' -isnot [Collections.Stack]) { return $this }
# If the stack is empty, return ourself
if ($this.'.Stack'.Count -eq 0) { return $this }
# Pop the stack
$popped = $this.'.Stack'.Pop()

$this. # Rotate by the differene in heading, 
    Rotate($popped.Heading - $this.Heading).
    # then teleport to the popped location
    Teleport($popped.Position.X, $popped.Position.Y)
