<#
.SYNOPSIS
    Sets the turtle path class
.DESCRIPTION
    Sets the css classes that apply to the turtle path.

    This property will rarely be set directly, but can be handy for integrating turtle graphics into custom pages.
#>
param(
$PathClass
)

$this |  Add-Member -MemberType NoteProperty -Force -Name '.PathClass' -Value @($PathClass)
