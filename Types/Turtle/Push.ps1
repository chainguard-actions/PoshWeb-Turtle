<#
.SYNOPSIS
    Pushes the Turtle Stack
.DESCRIPTION
    Pushes the current state of this Turtle onto a stack.

    If this stack is popped, the Turtle will teleport back to the location where it was pushed.

    By pushing and popping, we can draw multiple branches.
#>
if (-not $this.'.Stack') {
    $this | Add-Member NoteProperty '.Stack' ([Collections.Stack]::new()) -Force
}
$this.'.Stack'.Push(@{
    Position = [Ordered]@{X=$this.Position.X;Y=$this.Position.Y}
    Heading = $this.Heading
})
return $this