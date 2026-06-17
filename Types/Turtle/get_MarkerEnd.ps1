<#
.SYNOPSIS
    Gets a Turtle's end marker
.DESCRIPTION
    Gets the end marker used on the line drawn by the turtle
.EXAMPLE
    turtle viewbox 200 teleport 0 100 forward 100 markerEnd (
        turtle viewbox 10 rotate -90 polygon 10 3 # fill context-fill stroke context-stroke
    ) fill '#4488ff' stroke '#224488' strokewidth '3%' save ./marker.svg
#>
return $this.PathAttribute['marker-end']
