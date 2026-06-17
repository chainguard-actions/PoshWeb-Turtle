<#
.SYNOPSIS
    Sets the end marker
.DESCRIPTION
    Sets the end marker used on the line drawn by the turtle.

    If this is set to a string without spaces, it will be be treated as an identifier.
.EXAMPLE
    turtle viewbox 200 teleport 0 100 forward 100 markerEnd (
        turtle viewbox 10 rotate -90 polygon 10 3 # fill context-fill stroke context-stroke
    ) fill '#4488ff' stroke '#224488' strokewidth '3%' save ./marker.svg
.EXAMPLE
    turtle viewbox 200 teleport 0 100 forward 100 markerEnd (
        turtle viewbox 20 rotate -90 polygon 10 3 morph @(
            turtle rotate -90 polygon 20 3
            turtle rotate -90 polygon 20 3
        )
    ) strokewidth '3%' save ./marker.svg
#>
param($Value)

$attributeValue = 
    if ($value -is [string]) {
        if ($value -notmatch '\s' -and $value -notmatch '^url') {
            $Value = "url(`"$Value`")"
        } else {
            $value
        }
    }
    else {
        if ($value.pstypenames -contains 'Turtle') {
            $Value.id += "-end"
            $this.Defines+=$Value.Marker.OuterXml
            "url(#$($value.id)-marker)"
        }
    }

$this.PathAttribute['marker-end'] = $attributeValue

