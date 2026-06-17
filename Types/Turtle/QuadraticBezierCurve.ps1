<#
.SYNOPSIS
    Draws a quadratic Bezier Curve
.DESCRIPTION
    Draws a quadratic Bezier curve.  
.EXAMPLE
    turtle QuadraticBezierCurve 0 -100 100 -100 save ./q.svg
.EXAMPLE
    turtle QuadraticBezierCurve 0 -100 100 -100 QuadraticBezierCurve 100 100 100 100 save ./q2.svg
.EXAMPLE
    turtle @(
        'QuadraticBezierCurve', 0, -100, 100, -100
        'QuadraticBezierCurve', 100, 100, 100, 100
        'QuadraticBezierCurve', 0, 100, -100, 100
    ) save ./q3.svg
.EXAMPLE
    turtle @(
        'QuadraticBezierCurve', 0, -100, 100, -100
        'QuadraticBezierCurve', 100, 0, 100, 100
        'QuadraticBezierCurve', 0, 100, -100, 100
        'QuadraticBezierCurve', -100, 0, -100, -100
    ) save ./q4.svg
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
    $this.Position = $DeltaX, $DeltaY
    # If the pen is down
    if ($this.IsPenDown) {
        # draw the curve
        $this.Steps.Add("q $ControlX $ControlY $DeltaX $DeltaY")
    } else {        
        # otherwise, move to the deltaX/deltaY
        $this.Steps.Add("m $DeltaX $DeltaY")
    }
}

return $this


