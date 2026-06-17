<#
.SYNOPSIS
    Clears a Turtle
.DESCRIPTION
    Clears the heading, steps, position, minimim, maximum, and any nested Turtles.
.EXAMPLE
    turtle square 42 clear circle 21
#>
$this.Heading = 0
if ($this.Steps.Clear) {
    $this.Steps.Clear()
}
$this | Add-Member -MemberType NoteProperty -Force -Name '.Position' -Value ([pscustomobject]@{ X = 0; Y = 0 })
$this | Add-Member -MemberType NoteProperty -Force -Name '.Minimum' -Value ([pscustomobject]@{ X = 0; Y = 0 })
$this | Add-Member -MemberType NoteProperty -Force -Name '.Maximum' -Value ([pscustomobject]@{ X = 0; Y = 0 })
$this.ViewBox = 0
$this.Turtles.Clear()
return $this