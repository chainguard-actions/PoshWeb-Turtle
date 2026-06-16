param(
[PSObject]
$value
)

$this | Add-Member NoteProperty -Name '.BackgroundColor' -Value $value -Force
