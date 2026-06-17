<#
.SYNOPSIS
    Gets a Turtle's text element
.DESCRIPTION
    Gets a Turtle's text as a SVG Text element.

    If the Turtle does not have any text, this will return nothing.

    If the Turtle has text, but no path, the text will be centered in the Turtle's viewbox.
.LINK
    https://developer.mozilla.org/en-US/docs/Web/SVG/Reference/Element/text
.EXAMPLE
    turtle text "hello world" textElement
.EXAMPLE
    turtle text "hello world" title "Hi!" textElement
#>
[OutputType([xml])]
param()

# If there is no text, there's no text element
if (-not $this.Text) { return }

# Collect all of our text attributes
$textAttributes = [Ordered]@{
    id="$($this.ID)-text"
}

# If there are no steps
if (-not $this.Steps) {
    # default the text to the middle
    $textAttributes['dominant-baseline'] = 'middle'
    $textAttributes['text-anchor'] = 'middle'
    $textAttributes['x'] = '50%'
    $textAttributes['y'] = '50%'    
}

if ($this.fill -ne 'transparent') {
    $textAttributes['stroke'] = $this.stroke
    $textAttributes['fill'] = $this.fill
} else {
    $textAttributes['fill'] = $this.stroke
}


# Text Attributes can exist in Attribute or SVGAttribute, as long as they are prefixed.
$prefix = '^/?text/'
foreach ($collection in 'Attribute','SVGAttribute') {
    if (-not $this.$Collection.Count) { continue }
    foreach ($key in $this.$collection.Keys) {
        if ($key -match $prefix) {
            $textAttributes[$key -replace $prefix] = $this.$collection[$key]
        }
    }
}

# Explicit text attributes will be copied last, so they take precedent.
foreach ($key in $this.TextAttribute.Keys) {
    $textAttributes[$key] = $this.TextAttribute[$key]
}

# Return a constructed element
return [xml]@(
# Create the text element
"<text$(    
    foreach ($TextAttributeName in $TextAttributes.Keys) {
        " $TextAttributeName='$($TextAttributes[$TextAttributeName])'"
    }
)>"

# If there is a title
if ($this.Title) {
    # embed it here (so that the text is accessible).
    "<title>$([Security.SecurityElement]::Escape($this.Title))</title>"
} else {
    # otherwise, use the text as the title.
    "<title>$([Security.SecurityElement]::Escape($this.Text))</title>"
}

# If there are any text animations, include them here.
if ($this.TextAnimation) {$this.TextAnimation}

# Escape our text
$escapedText = [Security.SecurityElement]::Escape($this.Text)
# If we have steps,
if ($this.Steps) {
    # put the escaped text within a `<textPath>`.
    "<textPath href='#$($this.id)-path'>$escapedText</textPath>"
} else {
    # otherwise, include the escaped text as the content
    $escapedText
}
# close the element and return our XML.
"</text>"
)