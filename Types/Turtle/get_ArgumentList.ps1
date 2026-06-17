<#
.SYNOPSIS
    Gets the Turtle's arguments
.DESCRIPTION
    Gets a list of the arguments passed to the Turtle.

    We can reuse these arguments to recreate the Turtle.
.NOTES
    This will directly output each of the arguments, with the exception of `ArgumentList`
    (and any aliases to ArgumentList)
.EXAMPLE
    turtle rotate 45 forward 42 arguments
#>
if (-not $this.Invocations) { return }
foreach ($arg in $this.Invocations.BoundParameters['ArgumentList']) {
    if ($arg -notin 'ArgumentList', 'Arguments', 'Args','Argument') {
        $arg
    }
}