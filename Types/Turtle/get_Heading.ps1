<#
.SYNOPSIS
    Gets the turtle's heading.
.DESCRIPTION
    Gets the current heading of the turtle.
#>
param()
if ($this -and -not $this.psobject.properties['.TurtleHeading']) {
    $this.psobject.properties.add([PSNoteProperty]::new('.TurtleHeading', 0.0), $false)
}
return $this.'.TurtleHeading'

