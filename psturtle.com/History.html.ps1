<#
.SYNOPSIS
    A Brief History of Turtles
.DESCRIPTION
    A Brief History of Turtles, Robots, Graphics, and Technology
.NOTES
    ## A Brief History of Turtles

    The following is a brief and humorous introduction to Turtles, Turtle Robots, Turtle Graphics, vector motion, 
    and their long-term impact upon technology and the world around us.

    It is infused with personal opinion and attempts at light humor.  Please be kind.
#>
param()

$myHelp = Get-Help $MyInvocation.MyCommand.ScriptBlock.File

$title          = $myHelp.Synopsis
$description    = $myHelp.Description.text -join [Environment]::NewLine
$myNotes        = $myHelp.Notes.alertset.alert.text -join [Environment]::NewLine

if ($page -is [Collections.IDictionary]) {
    $page.Title = $title
    $page.Description = $description
}

$turtles1 = @'
### The First Turtles (1940s-1960s)

[Turtles](https://en.wikipedia.org/wiki/Turtle) have been walking and swimming for millions of years.

Humans came along much later.

In the 1940s, a human named [William Grey Walter](https://en.wikipedia.org/wiki/William_Grey_Walter) decided to make a Turtle robot.

Why?  Because they wanted to see how a simple brain responded to stimuli, and (probably) because robots were fun and interesting.

The original Turtles were [Elmer and Elsie](https://en.wikipedia.org/wiki/Elmer_and_Elsie_(robots)).

They were built between 1948 and 1949 out of war surplus and alarm clocks.

Each had a light or touch sensor attached to a pair of motors.

The record's not clear, but I'm pretty sure those motors controlled rotation and forward movement.

Turtles went on to become a teaching tool and inspiration to a generation of roboticists, 
and the first generation of turtle robots were born!

These robots all worked from the foundational principles of the first turtles:

* Stay simple
* Make instructions easy
* Think of movement in relative terms

This generation brought on a lot of industrial innovation, with the rise of [CNC robots](https://en.wikipedia.org/wiki/Computer_numerical_control).

These robots opened up a whole new door for the human race.

We could now make any shape we wanted, thanks to the pioneering work of a pair of turtles.

Turtles shape the world around us, and almost all robots descend from turtles (even if they don't know it).

The elegant machine controlled curves relative motion could create were formalized by [Pierre Bézier](https://en.wikipedia.org/wiki/Pierre_B%C3%A9zier),
and these curves changed culture as they became more widespread.

[Bézier curves](https://en.wikipedia.org/wiki/B%C3%A9zier_curve) were created in the 1960s, 
and helped give us the aesthetic of the [swinging 60s](https://en.wikipedia.org/wiki/Swinging_Sixties).

In the mid 60s, a few educators and programmers would start the next generation of turtles, and help open the doors of the universe.
'@

$turtles2 = @'

## Turles 2 - The Secret of the Ooze (1960s-1980s)

In the 60s, a trio of programmers and educators were trying to build an easy to learn programming language.

They were: [Wally Feurzeig](https://en.wikipedia.org/wiki/Wally_Feurzeig), [Seymour Papert](https://en.wikipedia.org/wiki/Seymour_Papert), and [Cynthia Solomon](https://en.wikipedia.org/wiki/Cynthia_Solomon).

They created a language called [Logo](https://en.wikipedia.org/wiki/Logo_(programming_language)), and built a newer, smaller [Turtle Bot](https://en.wikipedia.org/wiki/Turtle_(robot)).

Then they attached a pen.

And so Turtles learned to draw!

This was a pretty handy time to be making a programming language, especially one that helped you imagine points in space.

Why?

Well, an imaginary turtle doesn't _have_ to draw.  It can just calculate.

Fundamentally, a Turtle is just a point in space.

And, around the 1960s, people were thinking a lot about points in space.

An abstract turtle, moving in three dimensions, can calculate the path to the moon!

And so the second generation of turtles took us to space.  A lot of mission modelling was done with Turtle, and a highly optimized turtle called the [Apollo Guidance Computer](https://en.wikipedia.org/wiki/Apollo_Guidance_Computer) imagined landing on the moon before the astronauts touched down.

Programming Turtles became a great way to model the universe!

They allow us to imagine an infinite number of points in space, and see how little changes repeated hundreds or thousands of times change a system.

This newfound capability to draw any number of vectors helped visualize equations and explore fractal patterns in nature.

Even if you had to program in punchcards, programming Turtles in Logo was worth it.

One of the people who got interested in Turtles was a biologist named [Aristid Lindenmayer](https://en.wikipedia.org/wiki/Aristid_Lindenmayer)

They wanted to model the behavior of cells of plants, to understand the simple rules that drove the primordial ooze within a plant to grow.

They came up with the concept of an [L-Systems](https://en.wikipedia.org/wiki/L-system).

An L-System is described with an axiom, a set of rules, a number of iterations, and a way those rules are interpreted.

Lindermayer used them to model cell growth, then plant growth, and the field of computational biology grew from that seed.

Of course, it's not the only plant that took root.
'@

$turtles3 = @'

## Turtle 3 - Turtles in Time (1980s-Present)

By the end of the 1970s computers had gotten somewhat smaller, and a lot of little companies were sprouting up.

In 1978 and 1979, [Wally Feurzeig](https://en.wikipedia.org/wiki/Wally_Feurzeig), [Seymour Papert](https://en.wikipedia.org/wiki/Seymour_Papert), and [Cynthia Solomon](https://en.wikipedia.org/wiki/Cynthia_Solomon) and 
some other associates know as the Logo Group helped implemented Logo for Texas Instruments, creating the first graphic calculators.

They started Logo Computer Systems to help popularize the language, and they worked with a few companies to bring Turtle to the masses.

We're going to start with one you might know: Apple.

Part of Apple's early goals were expanding computers in the classroom and so they needed educational software.

One of the most popular pieces of software for schools was [Apple Logo](https://logothings.github.io/logothings/AppleLogo.html)

Throughout the 80s, schools were given Apple IIs at a steep discount, and kids across the world started to play with Turtles.

That's actually where I enter the picture.

As a kid of about 5 years old, I started running into Apple II computers at school, and when I got the chance, I played with Turtles.

I didn't really think too much of it at the time.

I certainly didn't think of it as anything like programming until fairly recently.

Looking back, it's clear that this is where I first felt the spark of creative inspiration that programming can bring.

I was not the only person inspired by playing with Turtles.  

Let's see some of Turtle's influence in time.

### Turtles in Typography (1980s-Present)

It also inspired some people working on printers and fonts, specifically, [John Warnock](https://en.wikipedia.org/wiki/John_Warnock).

To make a long story fairly short, all digital typefaces are vector graphics, scaled to a font size.

So every character you have read in this history of Turtles is, in fact, a turtle.

To blown your mind a bit further, each character lives in a box called the [em square](https://en.wikipedia.org/wiki/Em_(typography)).  EM squares are usually 2048 points wide.

So, each character has roughly have the 'resolution' of the screen it lives in.

Each glyph is a turtle with a pen, drawing a series of lines and curves.

This makes glyphs small and scalable.

It also makes every letter in every digital alphabet a turtle.

### Turtles in HTML (1990s-Present)

In addition to fonts, Turtle's influence was also clearly felt throughout early web development and in vector graphics.

In order to draw any text, a browser had to think like a turtle, character by character.

The browser is built up from the concepts in a typographic turtle.

Each tag is effectively the name of a type of turtle, containing a bunch of a text that are really nested turtles.

In 1999 the web standards solidified [SVG](https://en.wikipedia.org/wiki/SVG), which formalized how vector graphics were described within a website.

At the heart of SVG are [Paths](https://developer.mozilla.org/en-US/docs/Web/SVG/Tutorials/SVG_from_scratch/Paths), which represent a small set of absolute or relative moves.

Every site you visit is [Turtles all the way down](https://en.wikipedia.org/wiki/Turtles_all_the_way_down).

### Turtle Illustrations (1985-Present)

John Warnock brought turtles into every typeface.  They also brought turtles into everyday illustration.

In 1985, [Adobe Illustrator](https://en.wikipedia.org/wiki/Adobe_Illustrator) was first released.

Illustrator is a vector graphics illustration tool that is still widely popular, and
just like the typefaces Adobe Postscript pioneered, illustrator was built upon turtles.

It's primary competitor [Corel Draw](https://en.wikipedia.org/wiki/CorelDRAW) came out a few years later.
It also started with vector graphics, and presumably, a healthy amount of understanding of turtles.

### Turtles in 3D (1980-Present)

Turtles can work with any number of coordinates, and 3D turtles have extisted since at least 1980.  

They are discussed in detail in the wonderful book [Turtle Geometry](https://en.wikipedia.org/wiki/Turtle_Geometry), by [Hal_Abelson](https://en.wikipedia.org/wiki/Hal_Abelson) and [Andrea diSessa](https://en.wikipedia.org/wiki/Andrea_diSessa).

These concepts helped create some of the first 3D computer graphics, and this field has come a long way since [Tron](https://en.wikipedia.org/wiki/Tron).

One could argue that all computer generated images and all computer aided designs are descended from Turtles.

Around the same time, manufacuters began to experiment 3D printing.  

If you hooked up an extruder to a Turtle, instead of a pen, you could theoretically make things using less waste material.

3D Printers are, like all CNC machines, descendents of the first generation of Turtles.  The primary difference is that a 3D printer addi

The extruder is a turtle, and, instead of drawing with a pen, you draw by extruding plastic.

With the explosive growth of 3d printers after the popularization of [RepRap](https://en.wikipedia.org/wiki/RepRap), millions more people started to play with Turtles (even if they weren't realizing it).

### Python Turtles (2006-Present)

In 2006, someone named Gregor Lingl started making Turtle for Python.

(I wish I knew more about this person and what inspired them.  If you do, please reach out.)

[Python Turtle](https://docs.python.org/3/library/turtle.html) got pretty popular over the years.

It's now become a core part of of Python, and Python turtle examples are everywhere.  There's even on [online sandbox](https://pythonsandbox.com/turtle)!

Python turtle helped bring a new generation of people to turtle, and has generated some great visualizations over the years.

It helped remind the computing community about Turtle, and that inspiration spread to other languages and mediums.

### TurtleStitch (2015-Present)

One of the projects to come out of the third generation of Turtles is [TurtleStitch](https://www.turtlestitch.org/).

This was developed by [Andrea Mayr-Stalder](http://www.stitchcode.com/kontakt/), [Michael Aschauer](http://m.ash.to/), and [Tina Hochkogler](https://www.thkdesign.at/), with help from the open source community.

As the name implies, it allows you to create Turtle graphics embroidery.  

Not only has this helped another generation of people understand Turtles, it has also helped revolutionize the embroidery field.

Even better than that, [Cynthia Solomon](https://en.wikipedia.org/wiki/Cynthia_Solomon) started using TurtleStitch, and brought an [amazing number of Turtle designs]([https://www.turtlestitch.org/users/cynthiasolomon]) into embroidery form.

### One Laptop Per Child (2005-2014)

[The One Laptop Per Child](https://en.wikipedia.org/wiki/One_Laptop_per_Child) project was designed to help children all around the world learn more through cheap and easy access to technology.

Each laptop included a Turtle Graphics engine that [any child could control with a touchscreen](https://logothings.github.io/logothings/logo/OLPCIntro.html).

One Laptop Per Child was explicitly influenced by the work of [Seymour Papert]([https://en.wikipedia.org/wiki/Seymour_Papert]).

The hope was that by providing computer access from an early age, children could achieve full digital literacy.

Three million laptops were shipped all across the world in the One Laptop Per Child program.

I am pretty darn sure that many of those children will have brighter futures due to early exposure to programming.

Turtle has been an inspiration to millions of people for generations, and should inspire people for decades to come.

### Turtles in a PowerShell (2006-Present)

Speaking of people inspired by Turtle and Logo, let me tell you a bit about PowerShell.

PowerShell is a scripting language and shell made by Microsoft and first released in 2006.

It has been open source and cross-platform since 2016.

PowerShell was made to be easy to understand and close to natural language.

It was built by some particularly smart people, including:

* [Jeffrey Snover](https://en.wikipedia.org/wiki/Jeffrey_Snover)
* [Bruce Payette](https://github.com/BrucePay)
* [Jim Truher](https://github.com/jameswtruher)
* [Lee Holmes](https://github.com/LeeHolmes/)
* [Jason Shirk](https://github.com/lzybkr)

These people are "old hats" of technology, and know quite a bit about the history of computing (some of them even had front-row seats).

* Jeffrey Snover formerly worked at [DEC](https://en.wikipedia.org/wiki/Digital_Equipment_Corporation), an old company that built some of the first computers that ran Turtle.
* Bruce Payette may know more about different programming languages than 99.9% of the human race, and they combined that understanding to create a uniquely flexible language.
* Lee Holmes is an incredible developer with a deep expertise in security, a polymath's curiosity, and a love of tinkering.
* Jim Truher is an another amazing polymath, and one of the most knowlegable developers I have ever had the joy of knowing.  They are also one of the most fierce advocates Unix and open source Microsoft has ever seen.
* Jason Shirk is one of the best language developers I've ever seen, and helped drastically improve the C++ compiler at Microsoft before helping improve the PowerShell language.

The list of smart people could go on; I'm quite sure I'm leaving out many gifted colleagues.

In case this isn't quite clear, this is where I come back into the story.

Between 2000-2004, I built realtime video graphics system for performance purposes.  

I had been doing concert and nightclub video and lighting, and ended up making video manipulation software.

I learned how to program pixels and I had my first taste of building scripting languages.

In 2006, I joined the [PowerShell](https://en.wikipedia.org/wiki/PowerShell) team at Microsoft.

This will probably be the best job of my life, and the most impactful job I have ever had.

The language was built by a number of bright minds with a keen sense of computing history.

All of these people were deeply inspiring, and had been inspired by the previous decades of computing.

Working with a lot of "old hats" brought out a lot of old stories.

I don't quite remember who first suggested someone build a turtle in PowerShell, 
but I think [Lee Holmes](https://github.com/LeeHolmes/PowerShellLogo) was the first to put something out into the public.

People often seemed to presume PowerShell could only live inside of a terminal, and could not be used to build GUIs.

This was a perception Jeffrey Snover and I set out to change.

Thus I ended up on a more quixotic journey, building out some of the first PowerShell GUIs (in WPF, Winforms, and Web).

That's where I first ran into SVG Paths, and started to slowly learn about constructing shapes from scratch.

It took me a very long time to realize I was playing with Turtles again.

A few years ago (~2022), I made a wrapper for SVG in PowerShell - [PSSVG](https://github.com/StartAutomating/PSSVG)

This brought me back to constructing paths, and really helped me fall in love with the format.

SVG can be rendered inside of any page, because _SVG is HTML_.

To generate a webpage with rich graphics in PowerShell, we just generate a series of strings with some SVG.

This opened the door to infinite vector graphics PowerShell, but it didn't make it "easy".

It was hard to imagine the path to draw and describe it in short syntax.

To make it easy, I had to start thinking like a Turtle.

Then things really started to "click".

### Eureka! It's Turtles!

The first "click" was realizing that a Turtle's movement was really just a [Polar Coordinate](https://en.wikipedia.org/wiki/Polar_coordinate_system).

The second "click" was realizing that SVG paths could be relative, and thus I could express a Turtle's movements thru a series of steps.

The third "click" was that a turtle could be any object, as long as it had a heading, a pen, and steps.

These clicks came quickly, and within a few minutes I had whipped up a really basic Turtle in a script.

Here's a quick example of building a Turtle in PowerShell from scratch:

~~~PowerShell
# Define our custom object 
$turtle = [PSCustomObject]@{
    Heading = 0.0
    Steps = @()
    PenDown = $true
}

# Add a Rotate and Forward method, and a PathData script property
$turtle | 
    Add-Member ScriptMethod Rotate {
        param([double]$Angle)
        $this.Heading += $angle
        return $this
    } -Force -PassThru |
    Add-Member ScriptMethod Forward {
        param([double]$Distance)
        $x = $Distance * [math]::cos($this.Heading * [Math]::PI / 180)
        $y = $Distance * [math]::sin($this.Heading * [Math]::PI / 180)
        $letter = if ($this.PenDown) { "l" } else {"m" }
        $this.Steps += "$letter $x $y"
        return $this
    } -Force -PassThru |
    Add-Member ScriptProperty PathData {
        return "m 0 0 $($this.Steps)"
    }
    
        
# Make a basic triangle 
$turtle.
    Forward(42).Rotate(120).
    Forward(42).Rotate(120).
    Forward(42).Rotate(120)

# Put our path data into an XML
$svg = [xml]"<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 42 42' width='100%' height='100%'>
    <path d='$($turtle.PathData)' />
</svg>"

# Save it to a file
$svg.Save("$pwd/Triangle.svg")
~~~

Not only is this remarkably short, it also shows how simple it is to implement Turtle in any language.

This is especially interesting when we think about a Turtle in PowerShell.

Because PowerShell objects are so flexible, we can store all the information about our Turtle as a PowerShell object and translate it to other languages at the last second.

Once the dots had connected, I set to work making a PowerShell module for Turtle and learning all I could on the topic.

So far, I can confirm a few things:

1. Turtle Graphics are Fun!
2. There's lots of Turtle Power!
3. The Modern World Is Turtles All The Way Down

Please, explore this site and share your thoughts and feedback.
'@

if ($PSScriptRoot) { Push-Location $PSScriptRoot }

ConvertFrom-Markdown -InputObject @"

$myNotes

$(
    @(
        Get-ChildItem -Path ./History -Filter Turtles-*.md |
            Where-Object { $_.Name -match '-\d.md$'} |
            Get-Content -Raw
    ) -join (
        [Environment]::NewLine * 2
    )
)

"@ | Select-Object -ExpandProperty HTML

if ($PSScriptRoot) { Pop-Location }