function New-Turtle
{
    <#
    .SYNOPSIS
        Creates a new turtle.
    .DESCRIPTION
        Creates a brand new turtle.
    .NOTES
        You can also create an empty turtle simply by calling `Get-Turtle` with no parameters.
    .EXAMPLE
        $turtle = New-Turtle 
        $turtle.Square(100).Pattern.Save("$pwd/SquarePattern.svg")
    .EXAMPLE
        $newTurtle = New-Turtle
        $newTurtle.Polygon(42, 6)
    .EXAMPLE
        $NewTurtle = New-Turtle        
    #>
    param()
    [PSCustomObject]@{PSTypeName='Turtle'}
}
