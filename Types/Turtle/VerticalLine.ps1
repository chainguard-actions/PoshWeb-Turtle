<#
.SYNOPSIS
    Draws a vertical line
.DESCRIPTION
    Draws a vertical line.  
    
    The heading will not be changed.
#>
param(
[double]
$Distance
)

$this.GoTo($this.Position.X, $this.Position.Y + $Distance)
