<#
.SYNOPSIS
    Sets the middle marker
.DESCRIPTION
    Sets the middle marker used on the line drawn by the turtle.

    If this is set to a string without spaces, it will be be treated as an identifier.
.EXAMPLE
    turtle viewbox 200 start 10 200 rotate -60 @(
        'forward',42,'rotate',30,'forward',42,'rotate',-30 * 4
    ) markerMiddle (
        turtle circle 10 fill red 
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
            $Value.id += "-mid"
            $this.Defines+=$Value.Marker.OuterXml
            "url(#$($value.id)-marker)"
        }
    }

$this.PathAttribute['marker-mid'] = $attributeValue

