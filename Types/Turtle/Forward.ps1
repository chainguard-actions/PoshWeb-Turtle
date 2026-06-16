<#
.SYNOPSIS
    Moves the turtle forward
.DESCRIPTION
    Moves the turtle forward along the current heading
.EXAMPLE
    turtle forward rotate 90 forward rotate 90 forward rotate 90 forward rotate 90
#>
param(
# The distance to move forward
[double]
$Distance = 10
)

$x = $Distance * ([math]::round([math]::cos($this.Heading * [Math]::PI / 180),15))
$y = $Distance * ([math]::round([math]::sin($this.Heading * [Math]::PI / 180),15))
return $this.Step($x, $y)