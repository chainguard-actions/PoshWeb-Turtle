<#
.SYNOPSIS

.DESCRIPTION

#>
param(
$Module,

[uri]
$RootUrl
)

if (-not $module) {
    $module = $site.Module
}


if ($page -is [Collections.IDictionary]) {
    $page.Title = $module.Name
    $page.Description  = "$($module.Name) Commands"
}

$moduleCommands = Get-Command -Module $Module -CommandType All

$moduleCoreCommands = $moduleCommands | Where-Object Noun -eq $Module.Name

(ConvertFrom-Markdown -InputObject @"
$(
    @(
        $moduleCoreCommands |
            Sort-Object { @($_.Name -split '-')[0] } |
            Foreach-Object { "* [$($_.Name)](${RootUrl}Commands/$($_.Name)/)"}
    ) -join [Environment]::NewLine
)
"@).Html

