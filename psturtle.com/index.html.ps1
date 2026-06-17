if ($PSScriptRoot) { Push-Location $PSScriptRoot}
if (-not (Test-Path ./Examples)) {
    $null = New-Item -ItemType Directory -Path ./Examples -Force
}
Copy-Item ../Examples/* ./Examples -Force
Copy-Item ../README.md.ps1 ./ -Force
./README.md.ps1 > ./README.md
(ConvertFrom-Markdown -Path ./README.md).Html
if ($PSScriptRoot) { Pop-Location}
