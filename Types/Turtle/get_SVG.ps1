<#
.SYNOPSIS
    The Turtle's SVG
.DESCRIPTION
    Gets this turtle and any nested turtles as a single Scalable Vector Graphic.
#>
[OutputType([xml])]
param()

$svgAttributes = [Ordered]@{
    xmlns='http://www.w3.org/2000/svg'
    viewBox="$($this.ViewBox)"
    'transform-origin'='50% 50%'
    width='100%'
    height='100%'
}

# If opacity is set, it should apply to the entire SVG.
if ($null -ne $this.opacity) {
    $svgAttributes['opacity'] = $this.opacity
}

# If the viewbox would have zero width or height
if ($this.ViewBox[-1] -eq 0 -or $this.ViewBox[-2] -eq 0) {
    # It's not much of a viewbox at all, and we will omit the attribute.
    $svgAttributes.Remove('viewBox')
}

# Any explicitly provided attributes should override any automatic attributes.

# These can come from .Attribute
foreach ($key in $this.Attribute.Keys) {
    if ($key -match '^svg/') { # (as long as they start with `svg/`)
        $svgAttributes[$key -replace '^svg/'] = $this.Attribute[$key]
    }
}

# They can also come from `.SVGAttribute`
foreach ($key in $this.SVGAttribute.Keys) {
    $svgAttributes[$key] = $this.SVGAttribute[$key]
}

$svgElement = @(
"<svg $(@(foreach ($attributeName in $svgAttributes.Keys) {
    if ($attributeName -match '/') { continue }
    " $attributeName='$($svgAttributes[$attributeName])'"
}) -join '')>"
    # Declare any definitions, like markers or gradients.
    if ($this.Defines) {
        "<defs>"
            $this.Defines
        "</defs>"
    }
    
    $style = $this.Style
    if ($style -is [xml]) {
        $style.OuterXml
    }
        

    # Declare any SVG animations
    if ($this.SVGAnimation) {$this.SVGAnimation}
    if ($this.BackgroundColor) {
        "<rect width='10000%' height='10000%' x='-5000%' y='-5000%' fill='$($this.BackgroundColor)' transform-origin='50% 50%' />"
    }
    if ($this.Link) {
        "<a href='$($this.Link)'>"
    }
    # Output our own path
    $this.PathElement.OuterXml
    # Followed by any text elements
    $this.TextElement.OuterXml    

    # If the turtle has children
    $children = @(foreach ($turtleName in $this.Turtles.Keys) {
        # make sure they're actually turtles
        if ($this.Turtles[$turtleName].pstypenames -notcontains 'Turtle') { continue }
        # and then set their IDs
        $childTurtle = $this.Turtles[$turtleName]
        $childTurtle.ID = "$($this.ID)-$turtleName"
        $childTurtle
    })
    # If we have any children
    if ($children) {
        # put them in a group containing their children
        "<g id='$($this.ID)-children'>"            
            foreach ($child in $children) {
                # and ask for this child's inner XML
                # (which would contain any of its children) 
                # (and their children's children)
                # and so on.
                $child.SVG.SVG.InnerXML                
            }
        "</g>"
    }
    if ($this.Link) {
        "</a>"
    }
"</svg>"
)
[xml]$svgElement