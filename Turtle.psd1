@{    
    # Version number of this module.
    ModuleVersion = '0.2.1'
    # Description of the module
    Description = "Turtle Graphics in PowerShell"
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
        'Save-Turtle',
        'Set-Turtle',
        'Show-Turtle'
    # Format files (.ps1xml) to be loaded when importing this module
    # FormatsToProcess = @()
    # Functions to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no functions to export.
    VariablesToExport = '*'
    AliasesToExport = 'Turtle'
    PrivateData = @{
        PSData = @{
            # Tags applied to this module. These help with module discovery in online galleries.
            Tags       = 'PowerShell', 'Turtle', 'Graphics', 'TurtleGraphics', 'SVG', 'Drawing', 'L-System', 'Fractal'
            # A URL to the main website for this project.
            ProjectURI = 'https://github.com/PowerShellWeb/Turtle'
            # A URL to the license for this module.
            LicenseURI = 'https://github.com/PowerShellWeb/Turtle/blob/main/LICENSE'
            ReleaseNotes = @'
## Turtle 0.2.1:

* New Documentation:
  * Over 130 examples!
  * A Brief History of Turtles (#249)
* Website improvements
  * Copy Code Button! (#331)
  * Improved layout and new backgrounds (#333)
  * Improving build (#344)
  * Defaulting palette selection (#346)
* Major improvements
  * A turtle can now be any element!
  * Support for CSS keyframes, styles, and variables!
  * Vastly expanded SVG support, including bezier curves!
  * CircleArcs and Pie Graphs!  Improvements to circles.
* `Turtle` command improvements:
  * `Get-Turtle`
    * `Get-Turtle` help (#273) ( `turtle flower help` `turtle flower help examples`)
    * `Get-Turtle` now tracks commands (#250)
    * `Get-Turtle` now supports brackets (#255) and prebalances them (#262)
    * `Get-Turtle -AsJob` (#268)
    * `Get-Turtle` improved set errors (#252)
  * `Save-Turtle`
    * `Save-Turtle` saves as SVG by default (#259)
    * `Save-Turtle` autosaves by name (#269)
  * `Show-Turtle` will show the turtle (#257)  
* New methods:
  * `Turtle.a/Arc` (#231)
  * `Turtle.b/BezierCurve` (#228)
  * `Turtle.CircleArc` (#235)
  * `Turtle.c/CubicBezierCurve` (#230)
  * `Turtle.FractalShrub` (#332)
  * `Turtle.Leg` (#288)  
  * `Turtle.Pie/PieGraph` (#239)
  * `Turtle.q/QuadraticBezierCurve` (#229)
  * `Turtle.Repeat` (#256)
  * `Turtle.Spider` (#289)
  * `Turtle.Spiderweb` (#290)
  * `Turtle.Spokes` (#291)
  * `Turtle.Sun` (#297)
  * `Turtle.Show` (#258)  
* New properties:
  * `Turtle.get_ArgumentList` (#296)
  * `Turtle.get/set_Attribute` (#247)
  * `Turtle.get/set_Class` (#237)
  * `Turtle.get_Commands` (#250)
  * `Turtle.get_DataBlock` (#284)
  * `Turtle.get/set_Element` (#248)  
  * `Turtle.get/set_Defines` (#243)
  * `Turtle.get_ScriptBlock` (#253)   
  * `Turtle.get/set_Defines` (#243)
  * `Turtle.get/set_Keyframe(s)` (#251)
  * `Turtle.get_History` (#279)
  * `Turtle.get/set_Link/Href` (#241)
  * `Turtle.get/set_Locale` (#300)
  * `Turtle.get_Marker` (#227)
  * `Turtle.get/set_MarkerEnd` (#233)
  * `Turtle.get/set_MarkerMiddle` (#234)
  * `Turtle.get/set_MarkerStart` (#232)  
  * `Turtle.get/set_Opacity` (#293)
  * `Turtle.get/set_Precision` (#225)
  * `Turtle.ResizeViewBox` (#238)
  * `Turtle.get/set_Start` (#245)        
  * `Turtle.get/set_Style` (#254)
  * `Turtle.get/set_Variable` (#263)
  * `Turtle.get/set_Title` (#285)
* New pseudo type:
  * `Turtle.History`
    * `Turtle.History.ToString()` (#282)
    * `Turtle.History.DefaultDisplay` (#283)
  * `Turtle.js` (experimental)
    * Javascript version of turtle (#302)    
    * Initial Core Operations:
      * `Turtle.js.heading` (#303)
      * `Turtle.js.rotate` (#304)
      * `Turtle.js.forward` (#305) (#337) (#338)
      * `Turtle.js.isPenDown` (#306)
      * `Turtle.js.goTo` (#307)
      * `Turtle.js.step` (#308)
      * `Turtle.js.teleport` (#309) (#334)
      * `Turtle.js.steps` (#310)
      * `Turtle.js.min` (#311)
      * `Turtle.js.max` (#312)
      * `Turtle.js.resize` (#313)
      * `Turtle.js.x` (#314)
      * `Turtle.js.y` (#315)
      * `Turtle.js.width` (#316)
      * `Turtle.js.height` (#317)
      * `Turtle.js.pathData` (#318) (#339)
      * `Turtle.js.polygon` (#319) (#336) (#338)
      * `Turtle.js.penUp` (#322)
      * `Turtle.js.penDown` (#323)
      * `Turtle.js.parse` (#327)
      * `Turtle.js.go` (#330)
      * `Turtle.js.ToString.ps1()` (#320)
      * `Turtle.js.get_JavaScript.ps1` (#324)
    * Thanks @ninmonkey for early testing!
* Improved methods:
  * `Turtle.ArcLeft/ArcRight` allows StepCount (#272)
  * `Turtle.Circle` optimization (#287)
  * `Turtle.FractalPlant` improvement (#271)
  * `Turtle.HorizontalLine` is mapped to SVG `h` (#280)
  * `Turtle.VerticalLine` is mapped to SVG `v` (#281)  
* Improvemented Properties:
  * Adding `[OutputType([xml])]` to properties that output XML (#266)
  * `Turtle.get_Duration` defaults (#270)
  * `Turtle.get_Mask/PatternMask` returns only the mask (#261)  
  * `Turtle.set_BackgroundColor` applies to SVG directly (#260)  
  * `Turtle.get_Maximum` is a vector (#275)
  * `Turtle.get_Minimum` is a vector (#276)
  * `Turtle.get_Position` is a vector (#274)
  * `Turtle.set_Stroke` supports gradients (#295)
  * `Turtle.set_Fill` supports gradients (#294)
  * `Turtle.set_PathAnimation` will not overwrite a morph (#244)
  * `Turtle.get/set_PatternAnimation` uses duration (#299) and improved docs (#298)
  * `Turtle.get_TextElement` defaults to centered text (#265)
  * `Turtle.get_TextElement` improved color support (#292)
  * `Turtle.get_ViewBox` negative bounds (#286)
* More aliases:
  * Added Internationalized Aliases (i.e. `Turtle.BackgroundColour`) (#236)
  * SVG syntax aliases (#240)
* Fixed extra output in `Turtle.Pop` (#264)

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

