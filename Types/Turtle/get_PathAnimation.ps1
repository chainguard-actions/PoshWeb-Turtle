<#
.SYNOPSIS
    Gets the Turtle's Path Animation
.DESCRIPTION
    Gets any path animations associated with the current turtle.
.EXAMPLE
    turtle flower PathAnimation ([Ordered]@{
        attributeName = 'fill'   ; values = "#4488ff;#224488;#4488ff" ; repeatCount = 'indefinite'; dur = "4.2s" # ; additive = 'sum'
    }, [Ordered]@{
        attributeName = 'stroke'   ; values = "#224488;#4488ff;#224488" ; repeatCount = 'indefinite'; dur = "2.1s" # ; additive = 'sum'
    }, [Ordered]@{
        type = 'rotate'   ; values = 0, 360 ;repeatCount = 'indefinite'; dur = "41s"
    }) save ./AnimatedFlower.svg     
#>
if ($this.'.PathAnimation') {
    return $this.'.PathAnimation'
}
