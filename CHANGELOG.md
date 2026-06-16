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

## Turtle 0.1.10:

* Updated Methods
  * `Turtle.Star` even point fix (#190)
  * `Turtle.Polygon` partial polygon support (#194)
* New Shapes
  * `Turtle.Rectangle` (#192)
  * `Turtle.StarFlower` (#191)
  * `Turtle.GoldenFlower` (#193)
  * `Turtle.HatMonotile` (#196)
  * `Turtle.TurtleMonotile` (#195)
  * `Turtle.BarGraph` (#173)
* Added Demos
   * Intro To Turtles (#197)
   
---

## Turtle 0.1.9:

* Turtle Text Path Support
  * `Turtle.get/set_Text` controls the text (#167)
  * `Turtle.get/set_TextAttribute` sets text attributes (#168)
  * `Turtle.get/set_TextAnimation` animates text attributes (#171)
* `Get-Turtle` parameter improvements (#169, #170)
* `Get-Turtle` tracks invocation info (#157)

---

## Turtle 0.1.8:

* Turtle Performance
  * Improving `.Steps` performance (#159)
  * Reducing Turtle Verbosity (#160)
* New Moves:
  * Step (#161)
  * Forward,Teleport, and GoTo now use Step (#161)
* New Reflection Examples (#162)

---

## Turtle 0.1.7:

* Morphing Turtles
  * `Turtle.Morph` morphs shapes (#154)
  * `Turtle.get/set_Duration` control animation durations (#153)
  * [Lots of new examples](https://psturtle.com/Commands/Get-Turtle)
* New Fractals:
  * LevyCurve (#155)
  * Triplexity (#156)

---

## Turtle 0.1.6:

* Vastly expanded Get-Turtle examples (#149)
* Check out https://psturtle.com/Commands/Get-Turtle
* New L-Systems:
  * BoardFractal (#142)
  * CrystalFractal (#143)
  * RingFractal (#144)
  * TileFractal (#145)
  * Pentaplexity (#146)
* Fixing KochCurve parameter order (#147)
* Added New-Turtle docs (#148)


## Turtle 0.1.5:

* New Shapes:
  * Scissor draws a pair of lines at an angle (#128)
  * ScissorPoly draws a polygon out of scissors (#129)
* Fixes:
  * OffsetPath is now quoted (#130)
  * ArcLeft/Right distance fix (#131)

---

## Turtle 0.1.4

* `Turtle` Upgrades
  * `turtle` will return an empty turtle (#112)
  * `turtle` now splats to script methods, enabling more complex input binding (#121)
  * `LSystem` is faster and more flexible (#116)
* New Properties:
  * `get/set_Opacity` (#115)
  * `get/set_PathAnimation` (#117)
  * `get/set_Width/Height` (#125)
* New Methods:
  * `HorizontalLine/VerticalLine` (#126)
  * `Petal` (#119)
  * `FlowerPetal` (#124)
  * `Spirolateral` (#120)
  * `StepSpiral` (#122)
* Fixes:
  * `Turtle.Towards()` returns a relative angle (#123)

---

## Turtle 0.1.3

* Fixing `Get-Turtle` inline sets (#108, #107)
* Fixing `.PNG/JPEG/WEBP` to no longer try to use msedge (#110)
* Adding `Turtle.get/set_FillRule` to get or set the fill rule for the turtle. (#109)

---

## Turtle 0.1.2

* `Get-Turtle/Turtle` can now get or set properties or methods
* New Methods:
  * `Turtle.Distance()` determines the distance to a point
  * `Turtle.Towards()` determines the angle to a point
  * `Turtle.Home()` sends the turtle to 0,0
  * `Turtle.lt/rt` aliases help original Logo compatibility
  * `Turtle.Save()` calls Save-Turtle
* Explicitly exporting commands from module

---

## Turtle 0.1.1

* Updates:
  * `Turtle.get/set_ID` allows for turtle identifiers
  * `Turtle.ToString()` stringifies the SVG  
* Fixes:
  * Fixing GoTo/Teleport (#90)
  * Fixing Position default (#85) (thanks @ninmonkey !)
  * Fixing Turtle Action ID (#89)
* New:
  * `Turtle.Push()` pushes position/heading to a stack (#91)
  * `Turtle.Pop()` pops position/heading from a stack (#92)
  * `Turtle.get_Stack` gets the position stack (#93)
* New Fractals:
  * `BinaryTree()` (#94)
  * `FractalPlant()` (#95)

---

## Turtle 0.1

* Initial Release
* Builds a Turtle Graphics engine in PowerShell
* Core commands
  * `Get-Turtle` (alias `turtle`) runs multiple moves
  * `New-Turtle` create a turtle
  * `Move-Turtle` performas a single move
  * `Set-Turtle` changes a turtle
  * `Save-Turtle` saves a turtle

~~~PowerShell
turtle Forward 10 Rotate 120 Forward 10 Roate 120 Forward 10 Rotate 120 |
    Set-Turtle Stroke '#4488ff' |
    Save-Turtle ./Triangle.svg
~~~

* Core Object
  * `.Heading` controls the turtle heading
  * `.Steps` stores a list of moves as an SVG path
  * `.IsPenDown` controls the pen
  * `.Forward()` moves forward at heading
  * `.Rotate()` rotates the heading
  * `.Square()` draws a square
  * `.Polygon()` draws a polygon
  * `.Circle()` draws a circle (or partial circle)
* LSystems
  * Turtle can draw a L system.  Several are included:
    * `BoxFractal`
    * `GosperCurve`
    * `HilbertCurve`
    * `KochCurve`
    * `KochIsland`
    * `KochSnowflake`
    * `MooreCurve`
    * `PeanoCurve`
    * `SierpinskiTriangle`
    * `SierpinskiCurve`
    * `SierpinskiSquareCurve`
    * `SierpinskiArrowheadCurve`
    * `TerdragonCurve`
    * `TwinDragonCurve`
       
~~~PowerShell
turtle SierpinskiTriangle 10 4 |
    Set-Turtle Stroke '#4488ff' |
    Save-Turtle ./SierpinskiTriangle.svg    
~~~

