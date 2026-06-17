<#
.SYNOPSIS
    Determines the angle towards a point
.DESCRIPTION
    Determines the angle from the turtle's current heading towards a point.
#>
param()

$towards = $args | . { process { $_ } }

$tx = 0.0
$ty = 0.0

$nCount = 0
foreach ($toward in $towards) {
    if ($toward -is [double] -or $toward -is [float] -or $toward -is [int]) {
        if (-not ($nCount % 2)) {
            $tx = $toward 
        } else {
            $ty = $toward
        }
        $nCount++    
    }
    elseif ($null -ne $toward.X -and $null -ne $toward.Y) {
        $tx = $toward.x
        $ty = $toward.y
        $nCount+= 2        
    }
}

$tx/=($nCount/2)
$ty/=($nCount/2)

# Determine the delta from the turtle's current position to the specified point
$deltaX = $tx - $this.Position.X 
$deltaY = $ty - $this.Position.Y
# Calculate the angle in radians and convert to degrees
$angle = [Math]::Atan2($deltaY, $deltaX) * 180 / [Math]::PI
# Return the angle minus the current heading (modulo 360)
return $angle - ($this.Heading % 360)
