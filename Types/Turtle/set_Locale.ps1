<#
.SYNOPSIS
    Gets a Turtle's Locale
.DESCRIPTION
    Gets the locale associated with a Turtle.
    
    This is usually nothing, as a picture speaks a thousand words in any language.

    If it is set, it can be used to render content invisible unless the systemLanguage attribute matches the current language preference.
#>
$unrolledArgs = $args | . { process { $_ } }
$joinedArgs = $unrolledArgs -join ','
if (-not $joinedArgs) {
    $this.Attribute.Remove('systemLanguage')
    $this.SVGAttribute.Remove('systemLanguage')
} else {
    $this.Attribute['systemLanguage'] = $joinedArgs
    $this.SVGAttribute['systemLanguage'] = $joinedArgs
}
