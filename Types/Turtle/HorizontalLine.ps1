<#
.SYNOPSIS
    Draws a horizontal line
.DESCRIPTION
    Draws a horizontal line.  
    
    The heading will not be changed.
#>
param(
[double]
$Distance
)


$this.GoTo($this.Position.X + $Distance, $this.Position.Y)
