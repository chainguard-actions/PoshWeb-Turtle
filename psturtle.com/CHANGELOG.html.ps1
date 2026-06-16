<#
.SYNOPSIS
    Project CHANGELOG
.DESCRIPTION
    The CHANGELOG for the project
.NOTES
    The CHANGELOG is a record of major changes and releases for the project.
#>
param(
# We can provide the repository url by hard-coding it, or it can be provided in site or page metadata.
[uri]
$RepositoryUrl = "https://github.com/PowerShellWeb/Turtle",

# We can provide the changelog path by hard-coding it, or it can provided in site or page metadata.
[string]
$ChangeLogPath = '../CHANGELOG.md'
)


# Push into this location, in case we are building this file interactively.
if ($PSScriptRoot) { Push-Location $PSScriptRoot}

# Get my own help
$myHelp = Get-Help $MyInvocation.MyCommand.ScriptBlock.File
if ($myHelp) {
    # If we have page metadata
    if ($page -is [Collections.IDictionary]) {
        # Replace 'Project' in the title with the url, to make the title and description more helpful
        $page.Title = $myHelp.SYNOPSIS -replace 'Project', { 
            $RepositoryUrl.Segments[-1] -replace '/'
        }
        $page.Description = $myHelp.Description.text -join [Environment]::NewLine -replace 'The Project', {
            $RepositoryUrl.Segments[-1] -replace '/'
        }
    }

    # If we have notes, replace the project with our name
    $myNotes = $myHelp.alertSet.alert.text -join [Environment]::NewLine -replace 'The Project', {
        $RepositoryUrl.Segments[-1] -replace '/'
    }
    if ($myNotes) {
        # and convert our notes from markdown.
        (ConvertFrom-Markdown -InputObject $myNotes).Html
    }
}

# Break up the space a bit with horizontal rules.

"<hr/>"
# Display source for this page
"<details>"
    "<summary>View Source</summary>"
    "<pre>"
        "<code class='language-PowerShell'>"
            [Web.HttpUtility]::HtmlEncode($MyInvocation.MyCommand.ScriptBlock)
        "</code>"
    "</pre>"
"</details>"

# Break up the space a bit with horizontal rules.
"<hr/>"

# Get our changelog
(Get-ChildItem -Path $ChangeLogPath | 
    ConvertFrom-Markdown | # and convert it from markdown
    # Then, replace issue links
    Select-Object -ExpandProperty HTML) -replace '(?<=[\(\,)]\s{0,})\#\d+', {
        $match = $_                
        if ($RepositoryUrl) {
            # with actual links to the issues.
            $issueNumber = $($match -replace '\#' -as [int])
            "<a href='$RepositoryUrl/issues/$issueNumber'>" + "#$issueNumber" + "</a>"
        } else {
            "$match"
        }        
    }

# If we pushed into the location, pop back out.
if ($PSScriptRoot) { Pop-Location}

# We're done!
