<#
.SYNOPSIS
    Draws a Spider 
.DESCRIPTION
    Draws a Spider using a Turtle.
.NOTES
    This example was adapted from the Apple II Logo manual
.EXAMPLE
    turtle spider
.EXAMPLE
    turtle spider morph @(    
        turtle spider 42 10 
        turtle spider 42 15
        turtle spider 42 10
    ) show
.EXAMPLE
    turtle rotate 90 forward 120 rotate -90 spider 42
.EXAMPLE
    turtle rotate 90 forward 120 rotate -90 spider 42 morph @(
        turtle rotate 90 forward 1.2 rotate -90 spider 42 10
        turtle rotate 90 forward 120 rotate -90 spider 42 15
        turtle rotate 90 forward 1.2 rotate -90 spider 42 10
    ) |
        Save-Turtle ./SpiderDescendingMorph.svg
.LINK
    https://logothings.github.io/logothings/AppleLogo.html
#>
param(
# The size of each segment of the leg
[double]
$LegSize = 42,

# The rotation between each leg segment
[double]
$LegRotation = 10,

# The angle of the leg segment
[double]
$LegAngle = 90,

# The length of the head.
# One quarter of this value will be the "neck"
# One half of this value will be the "head"
[double]
$HeadLength = 2.5
)

# Right legs
$this = $this.Push()
foreach ($legNumber in 1..4) {
    $this = $this.
        Push().
        Leg($LegSize, $LegAngle, $LegSize, $LegAngle).
        Pop().
        Rotate(-$LegRotation)
}

# Reset our stack and flip to the other side
$this = $this.Pop().Push().Rotate(180)

# Left legs
foreach ($legNumber in 1..4) {
    $this = $this.
        Push().
        Leg($LegSize, -$LegAngle, $LegSize, -$LegAngle).
        Pop().        
        Rotate($LegRotation)
}


return $this.Pop().Push().
    Rotate(90).
    Forward(-$HeadLength/4).
    Rotate(-90).
    Circle(-$HeadLength/2).
    Pop()