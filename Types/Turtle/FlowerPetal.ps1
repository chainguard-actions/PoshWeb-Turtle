<#
.SYNOPSIS
    Draws a flower made of petals
.DESCRIPTION
    Draws a flower made of a series of petals.  
    
    Each petal is a combination of two arcs and rotations.
.EXAMPLE
    turtle FlowerPetal 60
#>
param(
# The radius of the flower
[double]
$Radius = 10,

# The rotation per step 
[double]
$Rotation = 30,

# The angle of the petal.
[double]
$PetalAngle = 60,

# The number of steps.
[ValidateRange(1,1mb)]
[int]
$StepCount = 12
)

foreach ($n in 1..$stepCount) {
    $this = $this.Petal($radius, $PetalAngle).Rotate($Rotation)    
}

return $this