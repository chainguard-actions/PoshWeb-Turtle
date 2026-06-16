<#
.SYNOPSIS
    Rotates the turtle.
.DESCRIPTION
    Rotates the turtle by the specified angle.
#>
param([double]$Angle = 90)
$this.Heading += $Angle
return $this