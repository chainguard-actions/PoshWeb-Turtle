<#
.SYNOPSIS
    Gets a turtle canvas
.DESCRIPTION
    Gets a turtle a canvas element.
#>

@(
    $viewBox = $this.ViewBox
    $null, $null, $viewX, $viewY = $viewBox
    "<style>canvas {max-width: 100%; height: 100%}</style>"
    "<canvas id='$($this.ID)-canvas' width='$($viewX + 1)' height='$($viewY + 1)'></canvas>"

    "<script>"    
@"
window.onload = async function() {
  var canvas = document.getElementById('$($this.ID)-canvas');
  var ctx = canvas.getContext('2d');
  ctx.strokeStyle = '$($this.Stroke)'
  ctx.lineWidth = '$(
    if ($this.StrokeWidth -match '%') {
        [Math]::Max($viewX, $viewY) * ($this.StrokeWidth -replace '%' -as [double])/100
    } else {
        $this.StrokeWidth
    }
)'
  ctx.fillStyle = '$($this.Fill)'
  var p = new Path2D("$($this.PathData)")
  ctx.stroke(p)
  ctx.fill(p)

  /*Insert-Post-Processing-Here*/
}
"@
    "</script>"
)

