if ($this.'.ViewBox') { return $this.'.ViewBox' }

$viewX = $this.Maximum.X + ($this.Minimum.X * -1)
$viewY = $this.Maximum.Y + ($this.Minimum.Y * -1)

return 0, 0, $viewX, $viewY


