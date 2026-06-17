<#
.SYNOPSIS
    Project License
.DESCRIPTION
    The License for the project
.NOTES
    The License for the project
#>
param(
# We can provide the repository url by hard-coding it, 
# or it can be provided in site or page metadata.
# If we do not provide either, we can also look at the `$gitHubEvent`
[uri]
$RepositoryUrl,

# We can provide the changelog path by hard-coding it, or it can provided in site or page metadata.
[string]
$LicensePath = '../LICENSE'
)

# Push into this location, in case we are building this file interactively.
if ($PSScriptRoot) { Push-Location $PSScriptRoot}

if (-not $RepositoryUrl) {
    if ($gitHubEvent.repository.html_url) {
        $repositoryUrl = $gitHubEvent.repository.html_url -as [uri]
    } else {
        return
    }
}

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

# Get our license
"<pre class='license'>"
[Web.HttpUtility]::HtmlEncode(
    (Get-ChildItem -Path $LicensePath | Get-Content -Raw)
)
"</pre>"

# If we pushed into the location, pop back out.
if ($PSScriptRoot) { Pop-Location}

# We're done!
