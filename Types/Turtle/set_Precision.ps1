<#
.SYNOPSIS
    Sets the Turtle's Precision
.DESCRIPTION
    Sets the level of precision a turtle should use for rounding.

    This is the number of digits a value will be rounded to.
    
    Lower precision will result in smaller filesizes, and a much better chance of stepwise animations working properly.

    Higher precision will result in large filesizes and will occassionally cause stepwise animations to get stuck.
#>
param(
# The number of decimal places used in rounding.
[ValidateRange(1,28)]
[int]
$Precision = 6
)

$this | Add-Member NoteProperty '.Precision' $Precision -Force


