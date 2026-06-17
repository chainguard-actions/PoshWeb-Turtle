<#
.SYNOPSIS
    Gets a Turtle's middle marker
.DESCRIPTION
    Gets the middle marker used on the line drawn by the turtle.

    This marker will be drawn on all vertices that are not the start or the end.
.EXAMPLE
    turtle viewbox 200 start 10 200 rotate -60 @(
        'forward',42,'rotate',30,'forward',42,'rotate',-30 * 4
    ) markerMiddle (
        turtle circle 10 fill red 
    ) strokewidth '3%' save ./marker.svg
#>
return $this.PathAttribute['marker-mid']
