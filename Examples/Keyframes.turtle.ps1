<#
.SYNOPSIS
    Turtles can now use keyframes
.DESCRIPTION
    Turtles can now use CSS keyframes.

    Here are a few examples.
#>

turtle id wiggle-square square 42 fill '#4488ff' stroke '#224488' keyframe ([Ordered]@{
    'wiggle3d' = [Ordered]@{
        '0%,100%' = [Ordered]@{
            transform = "rotateX(-3deg) rotateY(-3deg) rotateZ(-3deg)"            
        }
        '50%' = [Ordered]@{
            transform = "rotateX(3deg) rotateY(3deg) rotateZ(3deg)"
        }
    }
}) pathclass wiggle3d save ./Keyframes-Wiggle-Square.svg


turtle viewbox 84 id moving-square square 42 fill '#4488ff' stroke '#224488' keyframe ([Ordered]@{
    'moving-in-3d' = [Ordered]@{
        '0%,100%' = [Ordered]@{
            transform = "translate3d(0ch, 2ch, 5em) rotateY(-180deg)"            
        }
        '50%' = [Ordered]@{
            transform = "translate3d(5ch, 1ch, 5em) rotateY(0deg)"            
        }
    }
}) pathclass moving-in-3d save ./Keyframes-Moving-Square.svg

turtle id "wow-wow-wow-wow-wow" keyframe @{
    'bigger-font' = [Ordered]@{
        '0%' = @{
            'font-size' = '1rem'
        }
        '16%' = @{
            'font-size' = '2rem'
        }
        '32%' = @{
            'font-size' = '5rem'
        }
        '48%' = @{
            'font-size' = '10rem'
        }
        '64%' = @{
            'font-size' = '15rem'
        }
        '100%' = @{
            'font-size' = '20rem'
        }
    }
} duration '00:00:01.68' TextAttribute @{
    class='bigger-font'
} text ["wow"] save ./Keyframes-Wow.svg


