@("<animateMotion dur='$(
    if ($this.AnimateMotionDuration) {
        $this.AnimateMotionDuration
    } else {
        "$(($this.Points.Length / 2 / 10))s"
    }
)' repeatCount='indefinite' path='$($this.PathData)' />") -as [xml]