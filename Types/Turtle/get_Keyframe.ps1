<#
.SYNOPSIS
    Gets Turtle keyframes
.DESCRIPTION
    Gets CSS Keyframes animations associated with the Turtle.

    Keyframes are stored as a dictionary of dictionaries.

    Each key is the name of the keyframe.
    
    Each nested dictionary is the keyframe at a given percentage.
.EXAMPLE
    turtle keyframe ([Ordered]@{
        'slide-in' = [Ordered]@{
            from = [Ordered]@{
                translate = "-150vw 0"
                scale = "200% 1"            
            }
            to = [Ordered]@{
                translate = "0 0" 
                scale = "100% 1"
            }
        }
    }) keyframe
.LINK
    https://MrPowerShell.com/CSS/Keyframes
#>
if (-not $this.'.Keyframes') {
    $this | Add-Member NoteProperty '.Keyframes' ([Ordered]@{}) -Force
}
return $this.'.Keyframes'
