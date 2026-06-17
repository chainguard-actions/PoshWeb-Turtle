<#
.SYNOPSIS
    Gets a Turtle's Turtles
.DESCRIPTION
    Gets the Turtles contained within a Turtle object.

    These turtles may also contain turtles...
    which may also contain turtles... 
    which may also contain turtles...
    which may also contain turtles...
    all the way down.
.EXAMPLE
    turtle square 42 turtles @{
        circle = turtle circle 21        
    } save ./InscribedSquare.svg
     
.EXAMPLE
    turtle square 42 turtles @{
        square = 
            turtle teleport 4 4 square 34 turtles @{
                square = turtle teleport 8 8 square 26 turtles @{
                    square = turtle teleport 8 8 square 26 turtles @{
                        square = turtle teleport 12 12 square 18 turtles @{
                            square = turtle teleport 16 16 square 10
                        }
                    }
                }
            }        
    } save ./SquaresWithinSquares.svg
#>
if ($this -and -not $this.'.Turtles') {
    $this | Add-Member NoteProperty '.Turtles' ([Ordered]@{}) -Force 
}

return $this.'.Turtles'