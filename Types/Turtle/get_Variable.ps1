<#
.SYNOPSIS
    Gets Turtle Variables
.DESCRIPTION
    Gets variables associated with the Turtle.

    Variables that start with -- will become CSS variables
#>
param()

if (-not $this.'.Variables') {
    $this | Add-Member NoteProperty '.Variables' ([Ordered]@{}) -Force
}

return $this.'.Variables'