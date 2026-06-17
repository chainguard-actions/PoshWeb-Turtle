<#
.SYNOPSIS
    Gets a Turtle's class
.DESCRIPTION
    Gets any CSS classes associated with the turtle
.EXAMPLE
    turtle class foo bar baz bing class
#>
return $this.SVGAttribute["class"] -split '\s+'
