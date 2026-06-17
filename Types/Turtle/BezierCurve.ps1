<#
.SYNOPSIS
    Draws a Bezier Curve
.DESCRIPTION
    Draws a simple Bezier curve.  
.EXAMPLE
    turtle BezierCurve 0 -100 100 -100 save ./b1.svg
.EXAMPLE
    turtle BezierCurve 0 -100 100 -100 BezierCurve 100 100 100 100 save ./b2.svg
.EXAMPLE    
    turtle @(
        'BezierCurve', 0, -100, 100, -100
        'BezierCurve', 100, 100, 100, 100
        'BezierCurve', 0, 100, -100, 100
    ) save ./b3.svg
.EXAMPLE
    turtle @(
        'BezierCurve', 0, -100, 100, -100
        'BezierCurve', 100, 100, 100, 100
        'BezierCurve', 0, 100, -100, 100
        'BezierCurve', -100, -100, -100, -100        
    ) save ./b4.svg
.LINK
    https://en.wikipedia.org/wiki/B%C3%A9zier_curve
#>
param(
# The X control point
[double]
$ControlX,

# The Y control point
[double]
$ControlY,

# The delta X
[double]
$DeltaX,

# The delta Y
[double]
$DeltaY
)


if ($DeltaX -or $DeltaY) {
    $this.Position = $DeltaX,$DeltaY
    # If the pen is down
    if ($this.IsPenDown) {
        # draw the curve
        $this.Steps.Add("s $controlX $controlY $deltaX $deltaY")
    } else {        
        # otherwise, move to the deltaX/deltaY
        $this.Steps.Add("m $deltaX $deltaY")
    }
}

return $this

