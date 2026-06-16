<#
.SYNOPSIS
    Sets the turtle's heading.
.DESCRIPTION
    Sets the turtle's heading.  
    
    This is one of two key properties of the turtle, the other being its position.
#>
param(
# The new turtle heading.  
[double]
$Heading
)

if ($this -and -not $this.psobject.properties['.TurtleHeading']) {
    $this.psobject.properties.add([PSNoteProperty]::new('.TurtleHeading', 0), $false)
}
$this.'.TurtleHeading' = $Heading