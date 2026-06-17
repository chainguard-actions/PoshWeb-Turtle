<#
.SYNOPSIS
    Sets the Turtle SVG Animation
.DESCRIPTION
    Sets an animation for the Turtle's SVG.
.EXAMPLE
    turtle flower SVGAnimation ([Ordered]@{
        attributeName = 'fill'   ; values = "#4488ff;#224488;#4488ff" ; repeatCount = 'indefinite'; dur = "4.2s" # ; additive = 'sum'
    }, [Ordered]@{
        attributeName = 'stroke'   ; values = "#224488;#4488ff;#224488" ; repeatCount = 'indefinite'; dur = "2.1s" # ; additive = 'sum'
    }, [Ordered]@{
        type = 'rotate'   ; values = 0, 360 ;repeatCount = 'indefinite'; dur = "41s"
    }) save ./AnimatedFlower.svg
#>
param(
# The path animation object.
# This may be a string containing animation XML, XML, or a dictionary containing animation settings.
[PSObject]
$SVGAnimation
)

$newAnimation = @(foreach ($animation in $SVGAnimation) {
    if ($animation -is [Collections.IDictionary]) {
        $animationCopy = [Ordered]@{} + $animation
        if (-not $animationCopy['attributeType']) {
            $animationCopy['attributeType'] = 'XML'
        }
        if (-not $animationCopy['attributeName']) {
            $animationCopy['attributeName'] = 'transform'
        }
        if ($animationCopy.values -is [object[]]) {
            $animationCopy['values'] = $animationCopy['values'] -join ';'
        }

        $elementName = 'animate'
        if ($animationCopy['attributeName'] -eq 'transform') {
            $elementName = 'animateTransform'
        }


        if (-not $animationCopy['dur'] -and $this.Duration) {
            $animationCopy['dur'] = "$($this.Duration.TotalSeconds)s"
        }
        
        "<$elementName $(
            @(foreach ($key in $animationCopy.Keys) {
                " $key='$([Web.HttpUtility]::HtmlAttributeEncode($animationCopy[$key]))'"
            }) -join ''
        )/>"
    }
    if ($animation -is [string]) {
        $animation
    }
    if ($animation.OuterXml) {
        $animation.OuterXml
    }
})

$this | Add-Member -MemberType NoteProperty -Force -Name '.SVGAnimation' -Value $newAnimation
