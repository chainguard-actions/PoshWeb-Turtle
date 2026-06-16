if (-not $this.'.Stack') {
    $this | Add-Member NoteProperty '.Stack' ([Collections.Stack]::new()) -Force
}

$this.'.Stack'.Push(@{
    Position = [Ordered]@{X=$this.Position.X;Y=$this.Position.Y}
    Heading = $this.Heading
})
return $this