<#
.SYNOPSIS
    Includes `index.json`
.DESCRIPTION
    Includes content for an `index.json` file.

    This should be called after the build to generate a list of all files.
#>
#region index.json
if (-not $Site.NoIndex) {
    $fileIndex =
        if ($filePath) { Get-ChildItem -Recurse -File -Path $FilePath }
        else { Get-ChildItem -Recurse -File }    

    $replacement = 
        if ($filePath) {
            "^" + ([regex]::Escape($filePath) -replace '\*','.{0,}?')
        } else {
            "^" + [regex]::Escape("$pwd")
        }

    $indexObject    = [Ordered]@{}
    $gitCommand     = $ExecutionContext.SessionState.InvokeCommand.GetCommand('git', 'Application')
    foreach ($file in $fileIndex) {
        $gitDates = 
            try { 
                (& $gitCommand log --follow --format=%ci --date default $file.FullName *>&1) -as [datetime[]]
            } catch {
                $null
            }
        $LASTEXITCODE = 0
        
        $indexObject[$file.FullName -replace $replacement] = [Ordered]@{
            Name        = $file.Name            
            Length      = $file.Length
            Extension   = $file.Extension
            CreatedAt   = 
                if ($gitDates) {
                    $gitDates[-1]
                } else {
                     $file.CreationTime
                }
            LastWriteTime = 
                if ($gitDates) {
                    $gitDates[0]
                } else {
                    $file.LastWriteTime
                }
        }
    }
        
    foreach ($indexKey in $indexObject.Keys) {
        if (-not $indexObject[$indexKey].CreatedAt) {
            if ($indexObject["$indexKey.ps1"].CreatedAt) {
                $indexObject[$indexKey].CreatedAt = $indexObject["$indexKey.ps1"].CreatedAt
            }
        }
        if (-not $indexObject[$indexKey].LastWriteTime) {
            if ($indexObject["$indexKey.ps1"].LastWriteTime) {
                $indexObject[$indexKey].LastWriteTime = $indexObject["$indexKey.ps1"].LastWriteTime
            }            
        }
    }
    
    $indexObject | ConvertTo-Json -Depth 4
}
#endregion index.json
