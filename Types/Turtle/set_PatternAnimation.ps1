param(
[PSObject]
$PatternAnimation
)

$newAnimation = @(foreach ($animation in $PatternAnimation) {
    if ($animation -is [Collections.IDictionary]) {
        $animationCopy = [Ordered]@{} + $animation
        if (-not $animationCopy['attributeType']) {
            $animationCopy['attributeType'] = 'XML'
        }
        if (-not $animationCopy['attributeName']) {
            $animationCopy['attributeName'] = 'patternTransform'
        }
        if ($animationCopy.values -is [object[]]) {
            $animationCopy['values'] = $animationCopy['values'] -join ';'
        }
        
        "<animateTransform $(
            @(foreach ($key in $animationCopy.Keys) {
                " $key='$([Web.HttpUtility]::HtmlAttributeEncode($animationCopy[$key]))'"
            }) -join ''
        )/>"
    }
    if ($animation -is [string]) {
        $animation
    }
})

$this | Add-Member -MemberType NoteProperty -Force -Name '.PatternAnimation' -Value $newAnimation
