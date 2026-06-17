<#
.SYNOPSIS
    Gets the Turtle as a string
.DESCRIPTION
    Stringifies the Turtle.  
    
    This will return the turtle as an element, so it can be rendered within a web page.
#>
param()

$element = $this.Element
if ($element -is [xml]) {
    $element.OuterXml
} else {
    "$element"
}
return 