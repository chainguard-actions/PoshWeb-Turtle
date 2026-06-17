<#
.SYNOPSIS
    Sets the Turtle's ViewBox
.DESCRIPTION
    Sets the ViewBox for the Turtle.

    If not set, the viewbox will be automatically calculated.

    Once set, the viewbox will not be automatically calculated until it is set to four zeros.    
.EXAMPLE
    turtle viewbox
.LINK
    https://developer.mozilla.org/en-US/docs/Web/SVG/Reference/Attribute/viewBox
#>
param(
# The ViewBox coordinates.
[double[]]
$viewBox
)

# We have to ensure the viewbox only contains four points
$viewBox = switch ($viewBox.Length) {
    # If only one point was provided,
    1 {
        # check if it was negative.
        if ($viewBox[0] -lt 0) {
            # If it was, create a square anchored at that coordinate.
            $viewBox[0],$viewBox[0], [Math]::Abs($viewBox[0]), [Math]::Abs($viewBox[0])
        } else {
            # If the only point was positive, make a square anchored at <0,0>
            0,0, $viewBox[0], $viewBox[0]
        }        
    }
    # If two points were provided, we are making a rectangle
    2 {
        # If both points are negative, the rectangle is anchored at <-X,-Y>
        if ($viewBox[0] -lt 0 -and $viewBox[1] -lt 0) {
            $viewBox[0],$viewBox[1], [Math]::Abs($viewBox[0]), [Math]::Abs($viewBox[1])
        } 
        elseif ($viewBox[0] -lt 0) {
            # If only the X coordinate is negative, the rectangle is anchored at <-X,0>
            $viewBox[0], 0, [Math]::Abs($viewBox[0]), $viewBox[1]
        }
        elseif ($viewBox[1] -lt 0) {
            # If only the y coordinate is negative, the rectangle is anchored at <0,-Y>
            0, $viewBox[1], 0, [Math]::Abs($viewBox[1])
        }
        else {
            # If neither point is negative, the rectangle is anchored at <0,0>
            0,0, $viewBox[0], $viewBox[1]
        }        
    }
    3 {
        # If three points were provided, the first are anchors, and the third coordinate represents a square size        
        $viewBox[0], $viewBox[1], $viewBox[2],$viewBox[2]
    }
    default {
        # If four or more points were provided, take the first four
        $viewBox[0..3]
    }
}

# If all four coordinates are zero
if ($viewBox[0] -eq 0 -and 
    $viewBox[1] -eq 0 -and 
    $viewBox[2] -eq 0 -and  
    $viewBox[3] -eq 0
) {
    # remove the viewbox
    $this.psobject.Properties.Remove('.ViewBox')
    return # and return
}

# Otherwise, set the viewBox
$this | Add-Member -MemberType NoteProperty -Force -Name '.ViewBox' -Value $viewBox
