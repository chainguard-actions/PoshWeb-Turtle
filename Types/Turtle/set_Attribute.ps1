<#
.SYNOPSIS
    Sets Turtle attributes
.DESCRIPTION
    Sets arbitrary attributes for the current Turtle.

    Attributes generally apply to the topmost tag.  
    
    If an attribute contains a slash, it will be targeted to tags of that type.
.EXAMPLE
    turtle attribute @{foo='bar'} attribute
.EXAMPLE
    turtle attribute 'foo=bar' attribute
#>
param(
[PSObject[]]
$Attribute = [Ordered]@{}
)

$myAttributes = $this.Attribute
foreach ($attrSet in $Attribute) {
    if ($attrSet -is [Collections.IDictionary]) {
        foreach ($key in $attrSet.Keys) {
            $myAttributes[$key] = $attrSet[$key]
        }
    }
    elseif ($attrSet -is [string]) {
        if ($attrSet -match '[:=]') {
            $key, $value = $attrSet -split '[:=]', 2
            $myAttributes[$key] = $value
        } else {
            $myAttributes[$key] = ''
        }
    }
    elseif ($attrSet -is [PSObject]) {
        foreach ($key in $attrSet.psobject.properties.name) {
            $myAttributes[$key] = $attrSet.$key
        }
    }
    
}
