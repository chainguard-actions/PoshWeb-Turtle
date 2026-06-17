<#
.SYNOPSIS
    `Turtle.js` definition
.DESCRIPTION
    Our JavaScipt turtle is actually contained in a PowerShell object first.

    This object has a number of properties ending with `.js`.
    
    These are portions of the class.

    To create our class, we simply join these properties together, and output a javascript object.
#>
param()



$javaScript = "$($this.JavaScript)"
return $javaScript
