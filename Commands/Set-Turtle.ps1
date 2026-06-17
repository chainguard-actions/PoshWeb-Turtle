function Set-Turtle {
    <#
    .SYNOPSIS
        Sets a turtle.
    .DESCRIPTION
        Changes properties of a turtle, and returns the turtle.
    .EXAMPLE
        New-Turtle | 
            Move-Turtle SierpinskiTriangle 20 3 |
            Set-Turtle -Property Stroke -Value '#4488ff' |
            Save-Turtle "./SierpinskiTriangle.svg"
    #>
    param(
    # The property of the turtle to set.
    [Parameter(Mandatory)]
    [ArgumentCompleter({
        param ( $commandName, $parameterName, $wordToComplete, $commandAst, $fakeBoundParameters )
        $turtleType = Get-TypeData -TypeName Turtle
        $propertyNames = @(foreach ($memberName in $turtleType.Members.Keys) {
            if ($turtleType.Members[$memberName] -is [System.Management.Automation.Runspaces.ScriptPropertyData] -and
                $turtleType.Members[$memberName].SetScriptBlock) {
                $memberName
            }
        })
                
        if ($wordToComplete) {
            return $propertyNames -like "$wordToComplete*"
        } else {
            return $propertyNames
        }
    })]
    [string]
    $Property,
    
    # The value to set.
    [PSObject]
    $Value,

    # The turtle input object.
    [Parameter(ValueFromPipeline)]
    [Alias('Turtle')]
    [PSObject]
    $InputObject
    )

    process {
        # If there is no input object, return.
        if (-not $inputObject) { return }
        # Get the property to set.
        $propInfo = $inputObject.psobject.properties[$property]
        # If the property is not settable, return an error.
        if (-not $propInfo.SetterScript) {
            Write-Error "Property '$property' can not be set."
            return
        }
        # set the property value.
        $inputObject.$property = $Value
        # return our input for the next step of the pipeline.
        return $inputObject
    }
}
