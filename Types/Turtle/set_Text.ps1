<#
.SYNOPSIS
    Sets the Turtle text
.DESCRIPTION
    Sets the text displayed along the turtle path.

    Once this property is set, a text element will be displayed along with the turtle path.

    To display only text, please also set the path's stroke to `transparent`
#>
param(
[string[]]
$Text
)

$this | Add-Member NoteProperty '.Text' -Force ($text -join ' ')
