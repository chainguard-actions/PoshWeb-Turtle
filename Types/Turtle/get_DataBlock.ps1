<#
.SYNOPSIS
    Gets a Turtle as data block
.DESCRIPTION
    Gets our Turtle as a data block that will recreate our Turtle.

    The only commands that can be used in the data block are: `Turtle`, `Get-Turtle`, and `Get-Random`
.NOTES
    PowerShell data blocks provide a much more limited syntax.  
    
    They can only use simple expressions, cannot declare variables, use loops, declare script blocks, or use most types.

    They can also be declared with whitelist of Supported Commands.

    This property will return the current turtle inside of a data block, if possible.
    
    If any errors occur during conversion, they will be present in `$error`.
.LINK
    https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_data_sections?wt.mc_id=MVP_321542
#>
[OutputType([ScriptBlock])]
param()
[ScriptBlock]::Create("data -supportedCommand turtle, Get-Turtle, Get-Random {
    $($this.ScriptBlock)
}")

