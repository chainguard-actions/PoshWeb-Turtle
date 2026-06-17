<#
.SYNOPSIS
    Gets Turtle Precision
.DESCRIPTION
    Gets the rounding precision for the turtle.

    Any move the turtle makes will be rounded by this number of digits.

    Paths with more rounding may be more accurate at extremly high resolutions.
    
    They will have difficulty rendering stepwise animations and take up more file space per point.

    The default value for `Precision` is currently `6`
#>
if (-not $this.'.Precision') {
    $this | Add-Member NoteProperty '.Precision' 6 -Force
}
return $this.'.Precision'
