if ($this.'.AnimateMotionDuration') {
    return $this.'.AnimateMotionDuration'
}
$thesePoints = $this.Points
if ($thesePoints.Length -eq 0) {
    return "$(($thesePoints.Length / 2 / 10))s"
}
