<#
.SYNOPSIS
    Sets a Turtle's link
.DESCRIPTION
    Sets a link reference (`href`) associated with the turtle.

    If one is present, this will nest the turtle inside of an anchor `<a>` element
.EXAMPLE
    turtle link https://psturtle.com/
#>
param(
[string]
$Link
)

$this | Add-Member NoteProperty '.Link' $link -Force
