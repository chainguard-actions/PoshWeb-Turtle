<#
.SYNOPSIS
    Sets the Turtle Path Animation
.DESCRIPTION
    Sets an animation for the Turtle path.
.EXAMPLE
    $t = turtle defines @(
        "<radialGradient id='gradient'>
            <stop offset='33%' stop-color='red' />
            <stop offset='66%' stop-color='green' />
            <stop offset='100%' stop-color='blue' />
        </radialGradient>"
        "<radialGradient id='gradient2'>
            <stop offset='33%' stop-color='blue' />
            <stop offset='66%' stop-color='green' />
            <stop offset='100%' stop-color='red' />
        </radialGradient>"

    ) flower 42 fill 'url("#gradient")' stroke 'url("#gradient2")'     
    $t | turtle save ./gradient.svg
.EXAMPLE
    $t = turtle defines @(
        "<radialGradient id='gradient'>
            <stop offset='33%' stop-color='red' />
            <stop offset='66%' stop-color='green' />
            <stop offset='100%' stop-color='blue' />
        </radialGradient>"
        "<radialGradient id='gradient2'>
            <stop offset='33%' stop-color='blue' />
            <stop offset='66%' stop-color='green' />
            <stop offset='100%' stop-color='red' />
        </radialGradient>"        
    ) width 100 height 100 teleport 50 50 StarFlower 42 14.4 6 25 fill 'url("#gradient")' stroke 'url("#gradient2")' fillrule evenodd morph @(
        turtle teleport 50 50 StarFlower 42 12 5 30
        turtle teleport 50 50 StarFlower 42 14.4 6 25
        turtle teleport 50 50 StarFlower 42 12 5 30
    ) PathAnimation ( [Ordered]@{
        type = 'rotate'   ; values = 0, 360 ;repeatCount = 'indefinite'; dur = "4.2s"
    }) 
    $t | turtle save ./gradientrotate.svg
#>
param(
# The definition object.
# This may be a string, XML, a dictionary containing defines, or an element
[PSObject]
$Defines
)

$newDefinition = @(foreach ($definition in $Defines) {
    if ($definition -is [Collections.IDictionary]) {
        $definitionCopy = [Ordered]@{} + $definition                
        "<$elementName $(
            @(foreach ($key in $definitionCopy.Keys) {
                if ($key -eq 'Children') { continue }
                " $key='$([Web.HttpUtility]::HtmlAttributeEncode($definitionCopy[$key]))'"
            }) -join ''
        )$()>"
    }
    elseif ($definition -is [string]) {
        $definition
    }    
    elseif ($definition.OuterXml) {
        $definition.OuterXml
    }
    else {
        "$definition"
    }
})

$this | Add-Member -MemberType NoteProperty -Force -Name '.Defines' -Value $newDefinition
