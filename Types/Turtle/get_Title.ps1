<#
.SYNOPSIS
    Gets a Turtle's title
.DESCRIPTION
    Gets the title assigned to a Turtle.  
    
    A title will provide alternate text for the image that should be visible on hover, and should be available to screen readers.
.EXAMPLE
    turtle square 42 title "It's Hip To Be Square"
#>
return $this.'.Title'
