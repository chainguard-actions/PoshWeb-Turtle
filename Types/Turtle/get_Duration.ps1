<#
.SYNOPSIS
    Gets the duration
.DESCRIPTION
    Gets the default duration of animations and morphs.

    By default, 4.2 seconds.
#>
if ($null -eq $this.'.Duration') { 
    $this | Add-Member NoteProperty '.Duration' ([timespan]::FromSeconds(4.2)) -Force
}
return $this.'.Duration'
