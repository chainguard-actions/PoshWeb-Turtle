<#
.SYNOPSIS
    Gets the Turtle as a symbol.
.DESCRIPTION
    Returns the turtle as an SVG symbol element, which can be used in other SVG files.

    Symbols allow a shape to be scaled and reused without having the duplicate the drawing commands.

    By default, this will return a SVG defining the symbol and using it to fill the viewport.
.EXAMPLE
    Move-Turtle Flower |
        Select-Object -ExpandProperty Symbol
#>
param()

@(    
    "<svg xmlns='http://www.w3.org/2000/svg' width='100%' height='100%' transform-origin='50% 50%'>"
        "<symbol id='$($this.ID)-symbol' viewBox='$($this.ViewBox)' transform-origin='50% 50%'>"
            $($this.SVG.OuterXml)
        "</symbol>"
        $(
            if ($this.BackgroundColor) {
                "<rect width='10000%' height='10000%' x='-5000%' y='-5000%' fill='$($this.BackgroundColor)' transform-origin='50% 50%' />"
            }
        )
        "<use href='#$($this.ID)-symbol' width='100%' height='100%' transform-origin='50% 50%' />"
    "</svg>"
) -join '' -as [xml]