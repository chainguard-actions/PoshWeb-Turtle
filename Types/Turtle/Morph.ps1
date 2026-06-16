<#
.SYNOPSIS
    Morphs a Turtle
.DESCRIPTION
    Morphs a Turtle by animating its path.

    Any two paths with the same number of points can be morphed into each other.
.EXAMPLE
    $sierpinskiTriangle = turtle SierpinskiTriangle 42 4
    $SierpinskiTriangleFlipped = turtle rotate 180 SierpinskiTriangle 42 4
    turtle SierpinskiTriangle 42 4 morph (
        $SierpinskiTriangle, 
        $SierpinskiTriangleFlipped, 
        $sierpinskiTriangle
    ) save ./SierpinskiTriangleFlip.svg
.EXAMPLE
    $sideCount = (3..24 | Get-Random )
    $stepCount = 36
    
    $flower = turtle rotate ((Get-Random -Max 180) * -1) flower 42 10 $sideCount $stepCount
    $flower2 = turtle rotate ((Get-Random -Max 180)) flower 42 50 $sideCount $stepCount
    $flower3 = turtle rotate ((Get-Random -Max 90)) flower 42 20 $sideCount $stepCount
    turtle flower 42 10 $sideCount $stepCount duration ($sideCount * 3) morph ($flower, $flower2,$flower) |
        save-turtle ./flowerMorph.svg Pattern
.EXAMPLE
    $flowerAngle = (40..60 | Get-Random )
    $stepCount = 36
    $radius = 23..42 | Get-Random
    
    $flowerPetals = turtle rotate ((Get-Random -Max 180) * -1) flowerPetal $radius 10 $flowerAngle $stepCount    
    $flowerPetals3 = turtle rotate ((Get-Random -Max 180)) flowerPetal $radius 40 $flowerAngle $stepCount
    turtle flowerPetal $radius 10 $flowerAngle $stepCount duration $radius morph (
        $flowerPetals, 
        $flowerPetals3,
        $flowerPetals
    ) | Save-Turtle ./flowerPetalMorph.svg Pattern
#>
param(
[Parameter(ValueFromRemainingArguments)]
$Arguments
)

$durationArgument = $null

$newPaths = @(foreach ($arg in $Arguments) {
    if ($arg -is [string]) {
        if ($arg -match '^\s{0,}m') {
            $arg
        }
    } elseif ($arg.PathData) {
        $arg.PathData
    } elseif ($arg.D) {
        $arg.D
    } elseif ($arg -is [TimeSpan]) {
        $durationArgument = $arg
    }
    elseif ($arg -is [double] -or $arg -is [int]) {
        $durationArgument = [TimeSpan]::FromSeconds($arg)
    }
})

if (-not $newPaths) {
    return $this
    <#$pathSegments = @($this.PathData -split '(?=\p{L})')
    $newPaths = @(for ($segmentNumber = 0; $segmentNumber -lt $pathSegments.Count; $segmentNumber++) {
        $pathSegments[0..$segmentNumber] -join ' '
    }) -join ';'#>
}

if ($this.PathAnimation) {
    $updatedAnimations = 
        @(foreach ($animationXML in $this.PathAnimation -split '(?<=/>)') {
            $animationXML = $animationXML -as [xml]
            if (-not $animationXML) { continue }
            if ($animationXML.attributeName -eq 'd') {
                $animationXML.values = "$($newPaths -join ';')"
            }
            $animationXML.OuterXml
        })
    $this.PathAnimation = $updatedAnimations
} else {
    $this.PathAnimation += [Ordered]@{
        attributeName = 'd'   ; values = "$($newPaths -join ';')" ; repeatCount = 'indefinite'; dur = $(
            if ($durationArgument) {
                "$($durationArgument.TotalSeconds)s"
            } elseif ($this.Duration) {
                "$($this.Duration.TotalSeconds)s"
            } else {
                "4.2s"
            }
            
        )
    }
}

return $this