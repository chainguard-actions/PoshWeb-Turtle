<#
.SYNOPSIS
    Takes a Step 
.DESCRIPTION
    Makes a relative movement.
.EXAMPLE
    turtle step 5 5 step 0 -5 step -5 0 save ./stepTriangle.svg
#>
param(
# The DeltaX
[double]$DeltaX = 0, 
# The DeltaY
[double]$DeltaY = 0
)

# If both coordinates are empty, there is no step
if ($DeltaX -or $DeltaY) {
    $this.Position = $DeltaX, $DeltaY
    if ($This.IsPenDown) {
        $this.Steps += " l $DeltaX $DeltaY"
    } else {
        $this.Steps += " m $DeltaX $DeltaY"
    }
}

return $this
