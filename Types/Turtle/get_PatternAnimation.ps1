<#
.SYNOPSIS
    Gets pattern animations
.DESCRIPTION
    Gets one or more animations that apply to our Turtle's pattern.

    These animations will transform the pattern, allowing for endless variation.
.EXAMPLE    
    turtle flower PatternAnimation ([Ordered]@{
        type = 'translate'
        values = "0 0","0 420", "0 0"
        repeatCount = 'indefinite'        
        # dur = "11s" # The duration will default to the Turtle's duration
        additive = 'sum'
    }) save ./FlowerPatternAnimation.svg
.EXAMPLE
    # We can have multiple pattern animations, and need to use `additive=sum` to ensure they do not conflict
    turtle SierpinskiTriangle duration '00:00:42' PatternAnimation ([Ordered]@{
        type = 'rotate'
        values = "0","360"
        repeatCount = 'indefinite'
        additive = 'sum'
    }, [Ordered]@{
        type = 'scale'
        values = "1",".25", "1"
        repeatCount = 'indefinite'
        additive = 'sum'
    }) save ./SierpinskiTrianglePatternAnimation.svg
.EXAMPLE
    # Pattern Transforms set a starting state for animations
    turtle SierpinskiTriangle duration '00:00:42' PatternTransform @{
        scale = .25
    } PatternAnimation ([Ordered]@{
        type = 'rotate'
        values = "0","360"
        repeatCount = 'indefinite'
        additive = 'sum'
    }, [Ordered]@{
        type = 'scale'
        values = "1",".25", "1"
        repeatCount = 'indefinite'
        additive = 'sum'
    }) save ./SierpinskiTrianglePatternAnimationSmaller.svg
.EXAMPLE
    # We can use primes as pattern transform durations to ensure animations rarely overlap
    # This example uses four primes under 100:
    # It will repeat in `23 * 41 * 61 * 83` seconds
    # (or just over 55 days)
    turtle SierpinskiTriangle duration '00:00:42' PatternTransform @{
        scale = .25
    } PatternAnimation ([Ordered]@{
        type = 'rotate'
        values = "0","360"
        repeatCount = 'indefinite'
        dur = '83s'
        additive = 'sum'
    }, [Ordered]@{
        type = 'scale'
        values = "1",".25", "1"
        repeatCount = 'indefinite'
        dur = '23s'
        additive = 'sum'
    }, [Ordered]@{
        type = 'skewX'
        values = "0","45", "0"
        repeatCount = 'indefinite'
        additive = 'sum'
        dur = '41s'
    }, [Ordered]@{
        type = 'skewX'
        values = "0","-45", "0"
        repeatCount = 'indefinite'
        additive = 'sum'
        dur = '61s'
    }) save ./SierpinskiTrianglePatternAnimationEndless.svg
#>
if ($this.'.PatternAnimation') {
    return $this.'.PatternAnimation'
}
