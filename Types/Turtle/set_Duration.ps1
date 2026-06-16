<#
.SYNOPSIS
    Sets the duration
.DESCRIPTION
    Sets the default duration used for morphs and other animations.
#>
param(
# The value to set
$value
)

foreach ($v in $value) {
    if ($v -is [Timespan]) {
        $this | Add-Member NoteProperty '.Duration' $v -Force
    } elseif ($v -is [double] -or $v -is [int]) {
        $this | Add-Member NoteProperty '.Duration' ([TimeSpan]::FromSeconds($v)) -Force
    } else {
        Write-Warning "'$Value' is not a number or timespan"
    }
}

