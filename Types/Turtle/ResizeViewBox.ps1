<#
.SYNOPSIS
    Resizes the Turtle ViewBox
.DESCRIPTION
    Resizes the Turtle Viewbox to fit the current position
    
    (plus or minus a view rectangle)

    Any arguments that are primitive types will be considered a point.
#>
param()

# Any argument that is a point can influence the bounding box
# (though, for the moment, we only care about the first four)
$boundingPoints = @(foreach ($arg in $args) {
    if ($arg.GetType -and $arg.GetType().IsPrimitive) {
        $arg
    }
})

# If there were no points provided, we are resizing to fit nothing new
if (-not $boundingPoints) { $boundingPoints = @(0.0) }

# Set our mins and maxes to zero
$minX, $minY, $maxX, $maxY = @(0.0) * 4
# If there was one point provided
if ($boundingPoints.Length -eq 1) {
    # we want to make sure a square of this size would fit    
    $minX, $minY, $maxX, $maxY = $boundingPoints * 4
    $minX *= -1
    $minY *= -1
}
# If there were two points provided
elseif ($boundingPoints -eq 2)
{
    # We want to make sure a rectangle of this size would fit
    $minX, $minY, $maxX, $maxY = $boundingPoints * 2
    $minX *= -1
    $minY *= -1
}
# If there were four points
elseif ($boundingPoints -eq 4) {
    # Consider those the bounds we want.
    $minX, $minY, $maxX, $maxY = $boundingPoints
}

# Make sure we have a place to store our position
if (-not $this.'.Position') {
    $this |  Add-Member -MemberType NoteProperty -Force -Name '.Position' -Value ([Numerics.Vector2]@{ X = 0; Y = 0 })
}

# and minimum
if (-not $this.'.Minimum') {
    $this |  Add-Member -MemberType NoteProperty -Force -Name '.Minimum' -Value ([Numerics.Vector2]@{ X = 0; Y = 0 })
}
# and maximum
if (-not $this.'.Maximum') {
    $this |  Add-Member -MemberType NoteProperty -Force -Name '.Maximum' -Value ([Numerics.Vector2]@{ X = 0; Y = 0 })
}

# Resize our bounds as appropriate.
if ($this.'.Maximum'.X -lt ($this.Position.X + $maxX)) {
    $this.'.Maximum'.X = $this.Position.X + $maxX
}

if ($this.'.Minimum'.X -gt ($this.Position.X + $minX)) {
    $this.'.Minimum'.X = $this.Position.X + $minX
}

if ($this.'.Maximum'.Y -lt ($this.Position.Y + $maxY)) {
    $this.'.Maximum'.Y = $this.Position.Y + $maxY
}

if ($this.'.Minimum'.Y -gt ($this.Position.Y + $minY)) {
    $this.'.Minimum'.Y = $this.Position.Y + $minY
}

return $this