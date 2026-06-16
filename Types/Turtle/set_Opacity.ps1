<#
.SYNOPSIS
    Sets the opacity
.DESCRIPTION
    Sets the opacity of the path
.EXAMPLE
    turtle forward 100 opacity 0.5 save ./dimLine.svg
#>
param(
[double]
$Opacity = 'nonzero'
)

$this.PathAttribute = [Ordered]@{'opacity' = $Opacity}
