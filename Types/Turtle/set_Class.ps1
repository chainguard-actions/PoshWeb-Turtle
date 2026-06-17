<#
.SYNOPSIS
    Sets a Turtle's class
.DESCRIPTION
    Sets any CSS classes associated with the turtle
.EXAMPLE
    turtle class foo bar baz bing class
#>
param(
$Class
)

$this.Attribute['class'] = $this.SVGAttribute['class'] = $this.PathAttribute['class']  = $Class -join ' '
