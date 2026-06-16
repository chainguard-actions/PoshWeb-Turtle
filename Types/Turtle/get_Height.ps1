<#
.SYNOPSIS
    Gets the Turtle height
.DESCRIPTION
    Gets the Turtle's ViewBox height.
.NOTES
    If this has not been set, it will be automatically computed from the distance between the minimum and maximum.
.EXAMPLE
    turtle rotate 90 forward 100 width
#>
param()
if ($this.'.ViewBox') { 
    return @($this.'.ViewBox')[-1]
}

$viewY = $this.Maximum.Y + ($this.Minimum.Y * -1)
return $viewY



