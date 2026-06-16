<#
.SYNOPSIS
    Gets the turtle maximum point.
.DESCRIPTION
    Gets the maximum point reached by the turtle.

    Keeping track of this as we go is far more efficient than calculating it from the path.
#>
if ($this.'.Maximum') {
    return $this.'.Maximum'
}
return ([pscustomobject]@{ X = 0; Y = 0 })