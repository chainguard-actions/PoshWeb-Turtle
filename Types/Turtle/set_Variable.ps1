<#
.SYNOPSIS
    Sets Turtle variables
.DESCRIPTION
    Sets arbitrary variables for the current Turtle.

    Variables that begin with -- will become CSS variables.    
.EXAMPLE
    turtle variable @{
        '--red' = '#ff0000'
        '--green' = '#00ff00'
        '--blue' = '#0000ff'
    } style
#>
param(
# Any variables to set
[Collections.IDictionary[]]
$Variable = [Ordered]@{}
)

$myVariables = $this.Variable
foreach ($variableSet in $Variable) {
    foreach ($key in $variableSet.Keys) {
        $myVariables[$key] = $variableSet[$key]
    }
}
