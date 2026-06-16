if ($this.'.Stack' -isnot [Collections.Stack]) {
    return
}

if ($this.'.Stack'.Count -eq 0) {
    return
}

$popped = $this.'.Stack'.Pop()
$this.PenUp().Goto($popped.Position.X, $popped.Position.Y).PenDown()
$this.Heading = $popped.Heading
return $this