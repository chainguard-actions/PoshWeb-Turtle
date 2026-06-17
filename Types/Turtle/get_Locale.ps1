<#
.SYNOPSIS
    Gets a Turtle's Locale
.DESCRIPTION
    Gets the locale associated with a Turtle.
    
    This is usually nothing, as a picture speaks a thousand words in any language.

    If it is set, it can be used to render content invisible unless the systemLanguage attribute matches the current language preference.
#>
return $this.Attributes['systemLanguage']
