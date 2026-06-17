<#
.SYNOPSIS
    Includes `lastBuild.json`
.DESCRIPTION
    Includes the content for `lastBuild.json`.

    This should be called after the build to produce information about this build.
.EXAMPLE
    ./lastBuild.json.ps1
#>
#region lastBuild.json
# We create a new object each time, so we can use it to compare to the last build.
if (-not $site.LastBuildTime) { return }
if (-not $buildEnd -and $buildStart) { return }
$newLastBuild = [Ordered]@{
    LastBuildTime = $lastBuildTime
    BuildDuration = $buildEnd - $buildStart
    Message = 
        if ($gitHubEvent.commits) { 
            $gitHubEvent.commits[-1].Message
        } elseif ($gitHubEvent.schedule) {
            "Ran at $([DateTime]::Now.ToString('o')) on $($gitHubEvent.schedule)"
        } else {
            'On Demand'
        }
}

# If we have a CNAME, we can use it to get the last build time from the server.
$lastBuild =
    try {
        Invoke-RestMethod -Uri "https://$CNAME/lastBuild.json" -ErrorAction Ignore
    } catch {
        Write-Verbose ($_ | Out-String)
    }

# If we could get the last build time, we can use it to calculate the time since the last build.
if ($lastBuild) {
    $newLastBuild.TimeSinceLastBuild = $lastBuildTime - $lastBuild.LastBuildTime
}

# Save the build time to a file.
$newLastBuild | ConvertTo-Json -Depth 2
#endregion lastBuild.json
