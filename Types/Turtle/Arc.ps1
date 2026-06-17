<#
.SYNOPSIS
    Draws an Arc
.DESCRIPTION
    Draws an arc with the Turtle.
.NOTES
    This method directly corresponds to the `a` instruction in an SVG Path.
.LINK
    https://developer.mozilla.org/en-US/docs/Web/SVG/Tutorials/SVG_from_scratch/Paths#arcs
#>
param(
# The X Radius of the arc.
[double]
$RadiusX,

# The Y Radius of the arc.
[double]
$RadiusY,

# The rotation along the x-axis.
[double]
$Rotation = 0,

# If set to 1, will draw a large arc.
# If set to 0, will draw a small arc
[ValidateSet(0,1, "Large", "Small", $true, $false)]
[PSObject]
$IsLargeArc = 1,

# By default, the arc will be drawn clockwise
# If this is set to 1, the arc will be drawn counterclockwise
# If set to 1, will draw an arc counterclockwise
[ValidateSet(0, 1, 'Clockwise','CounterclockWise', 'cw', 'ccw', $true, $false)]
[PSObject]
$IsCounterClockwise = 0,

# The deltaX 
[double]
$DeltaX,

# The deltaY 
[double]
$DeltaY
)

if ($DeltaX -or $DeltaY) {
    $this.Position = $DeltaX,$DeltaY
    # If the pen is down
    if ($this.IsPenDown) {
        # draw the curve
        $LargeArcFlag = ($IsLargeArc -in 1, 'Large',$true) -as [byte]
        $SweepFlag = ($IsCounterClockwise -in 1, 'ccw','CounterClockwise', $true) -as [byte]
        $this.Steps.Add("a $RadiusX $RadiusY $Rotation $LargeArcFlag $SweepFlag $DeltaX $DeltaY")
    } else {        
        # otherwise, move to the deltaX/deltaY
        $this.Steps.Add("m $deltaX $deltaY")
    }
}

return $this


