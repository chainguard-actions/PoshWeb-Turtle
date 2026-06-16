if ($null -ne $this.'.Stack'.Count) {
    $this | Add-Member NoteProperty '.Stack' ([Collections.Stack]::new()) -Force
}
$this.'.Stack'
