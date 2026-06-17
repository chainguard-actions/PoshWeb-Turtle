<#
.SYNOPSIS
    Sets Path Transforms
.DESCRIPTION
    Sets any transforms that apply to the turtle path.
.EXAMPLE
    turtle width 100 height 100 teleport 25 25 square 50 pathTransform @{skewX=45} save ./skewSquare.svg
#>
param($value)
$value = $value | . { process { $_ }}
$transformString = foreach ($v in $value) {
    if ($v -is [Collections.IDictionary]) {
        foreach ($k in $v.Keys) {
            "$k($($v[$k]))"
        }
    } else {
        "$v"
    }
}


return $this.PathAttribute['transform'] = "$transformString"