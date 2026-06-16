$myName = $MyInvocation.MyCommand.Name -replace '\.turtle\.ps1$'
$turtle = 
    Move-Turtle SierpinskiTriangle 15 5 |
    Set-Turtle -Property Stroke -Value '#4488ff'
$turtle | Save-Turtle "./$myName.svg" 
$turtle | Save-Turtle "./$myName.png" -Property PNG
