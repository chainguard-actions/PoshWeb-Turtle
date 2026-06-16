@{    
    # Version number of this module.
    ModuleVersion = '0.2.0'
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
## Turtle 0.2:

### Turtles All The Way Down 

A turtle can now contain `.Turtles`
Which can contain `.Turtles`
Which can contain `.Turtles`
Which can contain `.Turtles`...

* Turtles all the way down (#206)
  * `Turtle.get/set_Turtles` (#207)
  * `Turtle.get_SVG` supports children (#209)
  * `Turtle.get_Canvas` rasterization improvement (#210)
  * `Turtle.Towards()` multiple targets (#211) 
  * `Turtle.Distance()` multiple targets (#212)
* `Turtle.Morph` supports stepwise animation (#215)
* Small fixes
  * `Turtle.Step()` uses Add (#213)
  * `Turtle.set_Steps` initialization fix (#214)
  * `Turtle.set_Duration` anytime (#216)
  * `Turtle.get_SVG` empty viewbox support (#218)
  * `Turtle.get/set_SVGAttribute` (#219)
  * `Turtle.get/set_SVGAnimation` (#220)
  * `Turtle.get/set_PathTransform` (#217)
  * `Turtle.Forward()` removing rounding (#221)

---

Additional details available in the [CHANGELOG](https://github.com/PowerShellWeb/Turtle/blob/main/CHANGELOG.md)

Please:

* [Like](https://github.com/PowerShell/Turtle)
* [Share](https://psturtle.com/)
* Subscribe
  * [psturtle.com](https://bsky.app/profile/psturtle.com)
  * [mrpowershell.com](https://bsky.app/profile/mrpowershell.com)
  * [StartAutomating](https://github.com/StartAutomating)
  * [PowerShellWeb](https://github.com/PowerShellWeb)
* Sponsor [StartAutomating](https://github.com/sponsors/StartAutomating)
'@        
        }
    }

    # HelpInfo URI of this module
    # HelpInfoURI = ''

    # Default prefix for commands exported from this module. Override the default prefix using Import-Module -Prefix.
    # DefaultCommandPrefix = ''
}

