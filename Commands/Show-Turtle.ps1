function Show-Turtle
{
    <#
    .SYNOPSIS
        Shows a Turtle
    .DESCRIPTION
        Shows a Turtle by opening it with the default file association.        
    .NOTES
        It is highly recommended that you show turtles in a browser;
        not all drawing programs support the full capabilities of SVG.
        
        There are a few circumstances where the Turtle will refuse to show.

        * If the session is not interactive
        * If $env:GITHUB_WORKFLOW is present
        * If $env:TURTLE_BOT is present
    #>
    [CmdletBinding(PositionalBinding=$false)]
    param(
    # The input object to show.
    # This should be a turtle, or a file a .svg,
    [Parameter(ValueFromPipeline)]
    [PSObject]
    $InputObject
    )

    begin {
        $validExtensions = @(
            '.svg',
            '.png',
            '.webp',
            '.jpe?g',
            '.html?'
        )
        $extensionPattern = "(?>$($validExtensions -replace '\.','\.' -join '|'))$"
    }
    process {
        # If we are not running interactively,
        # we obviously do not want to try to show something on the screen.
        if (-not [Environment]::UserInteractive -or $env:GITHUB_WORKFLOW -or $env:TURTLE_BOT) {
            # Instead, just pass thru our input.
            return $InputObject
        }
        if ($InputObject -is [IO.FileInfo] -and $InputObject.Extension -match $extensionPattern) {
            Invoke-Item $InputObject.Fullname
        } elseif ($InputObject.pstypenames -contains 'Turtle') {            
            New-Item -ItemType File -Path "./$($InputObject.id).svg" -Value "$InputObject" -Force |
                Invoke-Item
        } 
        elseif ($InputObject -is [string] -and $InputObject -match $extensionPattern) {
            $gotItem = Get-Item -Path $InputObject
            if ($gotItem) {
                Invoke-Item $gotItem.FullName
            }
        }
        elseif ($InputObject -is [xml]) {
            $fileName = if ($InputObject.svg) {
                "./$($InputObject.id).svg"
            }   
            elseif ($InputObject.html) {
                "./$($InputObject.id).html"
            }

            if ($fileName) {
                New-Item -ItemType File -Path $fileName -Value "$($InputObject.OuterXml)" -Force |
                    Invoke-Item
            }
        }
        else {
            Write-Error "Nothing to see here"
        }     
    }
}
