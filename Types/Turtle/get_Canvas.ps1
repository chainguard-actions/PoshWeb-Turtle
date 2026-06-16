<#
.SYNOPSIS
    Gets a turtle canvas
.DESCRIPTION
    Gets a turtle a canvas element.
#>
@(
    $viewBox = $this.ViewBox
    $null, $null, $viewX, $viewY = $viewBox    
    "<canvas id='$($this.ID)-canvas'></canvas>"    
    "<script type='module'>"    
@"
window.onload = async function() {
    const loadImage = async url => {
        const newImage = document.createElement('img')
        newImage.src = url
        return new Promise((resolve, reject) => {
            newImage.onload = () => resolve(newImage)
            newImage.onerror = reject
        })
    }
    const dataHeader = 'data:image/svg+xml;charset=utf-8'
    const serializeAsXML = e => (new XMLSerializer()).serializeToString(e)
    const encodeAsUTF8 = s => ```${dataHeader},`${encodeURIComponent(s)}``

    const img = await loadImage('$($this.DataUrl)')  
    
    var canvas = document.getElementById('$($this.ID)-canvas');
    canvas.width = $viewX
    canvas.height = $viewY
    var ctx = canvas.getContext('2d')
    ctx.drawImage(img, 0, 0, $viewX, $viewY)
    /*Insert-Post-Processing-Here*/
}
"@
    "</script>"
)

