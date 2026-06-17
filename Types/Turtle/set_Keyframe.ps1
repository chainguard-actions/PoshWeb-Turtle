<#
.SYNOPSIS
    Sets Turtle Keyframes
.DESCRIPTION
    Sets CSS Keyframes associated with a Turtle.
.EXAMPLE
    turtle square 42 fill '#4488ff' stroke '#224488' keyframe ([Ordered]@{
        'wiggle3d' = [Ordered]@{
            '0%,100%' = [Ordered]@{
                transform = "rotateX(-3deg) rotateY(-3deg) rotateZ(-3deg)"            
            }
            '50%' = [Ordered]@{
                transform = "rotateX(3deg) rotateY(3deg) rotateZ(3deg)"
            }
        }
    }) pathclass wiggle3d save ./wiggleSquare.svg 
#>
param(
[PSObject]
$Keyframe
)

$keyframes = $this.Keyframe
if ($Keyframe -is [Collections.IDictionary]) {
    foreach ($key in $keyframe.Keys) {
        $keyframes[$key] = $Keyframe[$key]
    }
}
