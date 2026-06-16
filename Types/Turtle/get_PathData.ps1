@(
    @(
        
        if ($this.Start.X -and $this.Start.Y) {
            "m $($this.Start.x) $($this.Start.y)"
        }
        else {
            @("m"
            if ($this.Minimum.X -lt 0) { 
                -1 * $this.Minimum.X
            } else {
                0
            }
            if ($this.Minimum.Y -lt 0) {
                -1 * $this.Minimum.Y
            } else {
                0
            }) -join ' '                       
        }
    )  + $this.Steps
    # @("m $($this.Start.x) $($this.Start.y) ") + $this.Steps
) -join ' '