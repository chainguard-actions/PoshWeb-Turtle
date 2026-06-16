param([string]$Value)

$this | Add-Member NoteProperty '.ID' $Value -Force
