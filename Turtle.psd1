@{    
    # Version number of this module.
    ModuleVersion = '0.1.9'
    # Description of the module
    Description = "Turtles in a PowerShell"
    # Script module or binary module file associated with this manifest.
    RootModule = 'Turtle.psm1'
    # ID used to uniquely identify this module
    GUID = '71b29fe9-fc00-4531-82ca-db5d2630d72c'
    # Author of this module
    Author = 'James Brundage'    

    # Company or vendor of this module
    CompanyName = 'Start-Automating'
    # Copyright statement for this module
    Copyright = '2025 Start-Automating'
    # Type files (.ps1xml) to be loaded when importing this module
    TypesToProcess = @('Turtle.types.ps1xml')

    FunctionsToExport = 
        'Get-Turtle',
        'Move-Turtle',
        'New-Turtle',
        'Set-Turtle',
        'Save-Turtle'
    # Format files (.ps1xml) to be loaded when importing this module
    # FormatsToProcess = @()
    # Functions to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no functions to export.
    VariablesToExport = '*'
    AliasesToExport = 'Turtle'
    PrivateData = @{
        PSData = @{
            # Tags applied to this module. These help with module discovery in online galleries.
            Tags       = 'PowerShell', 'Turtle', 'SVG', 'Graphics', 'Drawing', 'L-System', 'Fractal'
            # A URL to the main website for this project.
            ProjectURI = 'https://github.com/PowerShellWeb/Turtle'
            # A URL to the license for this module.
            LicenseURI = 'https://github.com/PowerShellWeb/Turtle/blob/main/LICENSE'
            ReleaseNotes = @'
## Turtle 0.1.9:

* Turtle Text Path Support
  * `Turtle.get/set_Text` controls the text (#167)
  * `Turtle.get/set_TextAttribute` sets text attributes (#168)
  * `Turtle.get/set_TextAnimation` animates text attributes (#171)
* `Get-Turtle` parameter improvements (#169, #170)
* `Get-Turtle` tracks invocation info (#157)

---

Additional details available in the [CHANGELOG](https://github.com/PowerShellWeb/Turtle/blob/main/CHANGELOG.md)
'@        
        }
    }

    # HelpInfo URI of this module
    # HelpInfoURI = ''

    # Default prefix for commands exported from this module. Override the default prefix using Import-Module -Prefix.
    # DefaultCommandPrefix = ''
}

