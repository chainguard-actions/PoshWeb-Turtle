<#
.SYNOPSIS
    Gets Turtle attributes
.DESCRIPTION
    Gets attributes of the turtle.
    
    These attributes apply directly to the Turtle as an `.Element`.

    They can also be targeted to apply to an aspect of the turtle, such as it's Pattern, Path, Text, Mask, or Marker.

    To set an attribute that targets an aspect of the turtle, prefix it with the name followed by a slash.

    (for example `path/data-key` would set an attribute on the path)
.EXAMPLE
    turtle attribute @{someKey='someValue'} attribute
#>
if (-not $this.'.Attributes') { 
    $this | Add-Member NoteProperty '.Attributes' ([Ordered]@{}) -Force    
}
return $this.'.Attributes'