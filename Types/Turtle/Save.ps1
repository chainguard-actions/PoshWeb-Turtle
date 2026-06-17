<#
.SYNOPSIS
    Saves the turtle.
.DESCRIPTION
    Saves the current turtle to a file.
.LINK
    Save-Turtle
#>
param(
[Parameter(Mandatory)]
[string]
$FilePath,

[string]
$Property
)

$saveSplat = [Ordered]@{FilePath = $FilePath}
if ($Property) {
    $saveSplat.Property = $property
}

return $this | Save-Turtle @saveSplat
