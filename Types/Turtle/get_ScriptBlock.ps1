<#
.SYNOPSIS
    Get the Turtle's ScriptBlock
.DESCRIPTION
    Gets the ScriptBlock used to create the turtle.

    All steps will become a fluent pipeline.
.EXAMPLE
    turtle SierpinskiTriangle 42 4 scriptBlock
#>
[OutputType([ScriptBlock])]
param()
# Join all of our previous command extents into a fluent pipeline
$stringifiedScript = $this.Commands.Extent -join 
    (' |' + [Environment]::NewLine + '    ') -replace # and then replace any unescaped use of 'ScriptBlock' or 'DataBlock'
    "(?<!\[)(?>$(
        'ScriptBlock', 'DataBlock' -join '|'
    ))(?!\])\s{0,}"
[ScriptBlock]::Create($stringifiedScript)
