#requires -Module PSDevOps
Import-BuildStep -SourcePath (
    Join-Path $PSScriptRoot 'GitHub'
) -BuildSystem GitHubWorkflow

Push-Location ($PSScriptRoot | Split-Path)
New-GitHubWorkflow -Name "Build Turtle Module" -On Push,
    PullRequest, 
    Demand -Job  TestPowerShellOnLinux, 
    TagReleaseAndPublish, BuildTurtle -Environment ([Ordered]@{
        REGISTRY = 'ghcr.io'
        IMAGE_NAME = '${{ github.repository }}'
    }) -OutputPath .\.github\workflows\BuildTurtle.yml

Pop-Location