<#
.SYNOPSIS
    Sets the Turtle Text Animation
.DESCRIPTION
    Sets an animation for the Turtle path.
.EXAMPLE
    turtle rotate 90 jump 50 rotate -90 forward 100 text 'Hello World' textAnimation ([Ordered]@{
        attributeName = 'fill'   ; values = "#4488ff;#224488;#4488ff" ; repeatCount = 'indefinite'; dur = "4.2s"
    },[Ordered]@{
        attributeName = 'font-size'   ; values = "1em;1.3em;1em" ; repeatCount = 'indefinite'; dur = "4.2s"
    }) save ./textAnimation.svg
#>
param(
# The text animation object.
# This may be a string containing animation XML, XML, or a dictionary containing animation settings.
[PSObject]
$TextAnimation
)

$newAnimation = @(foreach ($animation in $TextAnimation) {
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

$this | Add-Member -MemberType NoteProperty -Force -Name '.TextAnimation' -Value $newAnimation
