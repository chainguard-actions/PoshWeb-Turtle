<#
.SYNOPSIS
    Gets the Turtle width
.DESCRIPTION
    Gets the Turtle's ViewBox width.
.NOTES
    If this has not been set, it will be automatically computed from the distance between the minimum and maximum.
.EXAMPLE
    turtle forward 100 width
#>
if ($this.'.ViewBox') { 
    return @($this.'.ViewBox')[-2]
}

$viewX = $this.Maximum.X + ($this.Minimum.X * -1)
return $viewX


