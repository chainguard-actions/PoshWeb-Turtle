<#
.SYNOPSIS
    Gets a Turtle's lowest point
.DESCRIPTION
    Gets the minimum vector for this turtle.  
    
    This would the lowest point that the turtle has visted.
#>
[OutputType([Numerics.Vector2])]
param()
if (-not $this.'.Minimum') {
    $this | Add-Member NoteProperty '.Minimum' ([Numerics.Vector2]::new(0,0)) -Force
}

return $this.'.Minimum'