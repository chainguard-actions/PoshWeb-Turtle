<#
.SYNOPSIS
    `Turtle.js` definition
.DESCRIPTION
    Our JavaScipt turtle is actually contained in a PowerShell object first.

    This object has a number of properties ending with `.js`.
    
    These are portions of the class.

    To create our class, we simply join these properties together, and output a javascript object.
.NOTES
    This is an experimental feature and is subject to change and improvement.
.EXAMPLE    
    $turtleJs = [PSCustomObject]@{PSTypeName='Turtle.js'}
    $html = @(    
        "<html><body>"
        "<svg id='output' width='100%' height='100%'>"
            "<path id='outputPath' stroke='#4488ff' />"
        "</svg>"
        "<script>"
        "const turtle = $turtleJS"
        "turtle.go('ROTATE', 45,'forward', 42)"
        "document.getElementById('outputPath').setAttribute('d',turtle.pathData)"
        "document.getElementById('output').setAttribute('viewBox', ``0 0 `${turtle.width} `${turtle.height}`` )"
        "</script>"
        "</body></html>"
    ) > ./TurtleTest.html
#>
param()

$objectParts = 

foreach ($javaScriptProperty in $this.psobject.properties | Sort-Object Name) {
    # We only want the .js properties
    if ($javaScriptProperty.Name -notmatch '\.js$') { continue }
    # If the property is a function, we need to handle it differently
    if ($javaScriptProperty.value -match '^function.+?\(') {
        # specificically, we need to remove the "function " prefix from the name
        $predicate, $extra = $javaScriptProperty.value -split '\(', 2
        # and then we need to reassemble it as a javascript method
        $functionName = $predicate -replace 'function\s{1,}'
        if ($functionName -match '^[gs]et_') {
            $getSet = $functionName -replace '_.+$'
            $propertyName = $functionName -replace '^[gs]et_'
            if ($getSet -eq 'get') {
                $extra = $extra -replace '^.{0,}\)\s{0,}'
                "$getSet ${propertyName}() $($extra)"
            } else {
                "$getSet ${propertyName}($($extra)"
            }
            
        } else {
            "${functionName}:function ($extra"
        }
        
    }
    else {
        # Otherwise, include it inline.
        $javaScriptProperty.value
    }
    
}
# Since we are building a javascript object, we need to wrap everything in curly braces
@("{
"
# Indentation does not matter to most machines, but people tend to appreciate it.
"  "
($objectParts -join (',' + [Environment]::Newline + '  '))
"}") -join ''
