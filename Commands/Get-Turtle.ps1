function Get-Turtle {
    <#
    .SYNOPSIS
        Gets Turtles
    .DESCRIPTION
        Gets turtles in a PowerShell.
    .NOTES
        Turtle Graphics are pretty groovy.
        
        They have been kicking it since 1966, and they are how computers first learned to draw.

        They kicked off the first computer-aided design boom and inspired generations of artists, engineers, mathematicians, and physicists.

        They are also _incredibly_ easy to build.

        A Turtle graphic is described with a series of moves.

        Let's start with the core three moves:
        
        Imagine you are a Turtle holding a pen.

        * You can turn `rotate`
        * You can move `forward`
        * You can lift the pen

        These are the three basic moves a turtle can make.
        
        We can describe more complex moves by combining these steps.

        Each argument can be the name of a move of the turtle object.

        After a member name is encountered, subsequent arguments will be passed to the member as parameters.

        Any parameter that begins with whitespace will be split into multiple words.
    .EXAMPLE
        # We can write shapes as a series of steps
        turtle "
            rotate 120
            forward 42 
            rotate 120 
            forward 42 
            rotate 120 
            forward 42
        "
    .EXAMPLE
        # We can also use a method.
        # Polygon will draw an an N-sided polygon.
        turtle polygon 10 5
    .EXAMPLE
        # A simple case of this is a square
        turtle square 42
    .EXAMPLE
        # If we rotate 45 degrees first, our square becomes a rhombus
        turtle rotate 45 square 42
    .EXAMPLE
        # We can draw a circle 
        turtle circle 10
    .EXAMPLE
        # Or a pair of half-circles
        turtle circle 10 0.5 rotate 90 circle 10 0.5
    .EXAMPLE
        # We can multiply arrays in PowerShell
        # this can make composing complex shapes easier.
        # Let's take the previous example and repeat it 8 times.
        turtle @('circle',42,0.5,'rotate',90 * 8)
    .EXAMPLE
        # Let's make a triangle by multiplying steps
        turtle ('forward', 10, 'rotate', 120 * 3)
    .EXAMPLE
        # We can also write this with a polygon
        turtle polygon 10 3    
    .EXAMPLE
        # Let's make a series of polygons, decreasing in size
        turtle polygon 10 6 polygon 10 5 polygon 10 4
    .EXAMPLE
        # We can also use a loop to produce a series of steps
        # Let's extend our previous example and make 9 polygons
        turtle @(
            foreach ($n in 12..3) {
                'polygon'
                42
                $n
            }
        )
    .EXAMPLE
        # We can use the same trick to make successively larger polygons
        turtle @(
            $sideCount = 3..8 | Get-Random 
            foreach ($n in 1..5) {
                'polygon'
                $n * 10
                $sideCount
            }
        )
    .EXAMPLE
        # We can reflect a shape by drawing it with a negative number
        turtle polygon 42 3 polygon -42 3
    .EXAMPLE
        # We can change the angle of reflection by rotating first
        turtle rotate 60 polygon 42 3 polygon -42 3
    .EXAMPLE
        # We can morph any N shapes with the same number of points.        
        turtle square 42 morph @(
            turtle square 42
            turtle rotate 45 square 42
            turtle square 42
        )
    .EXAMPLE
        # Reflections always have the same number of points.
        # 
        # Morphing a shape into its reflection will zoom out, flip, and zoom back in.
        turtle polygon 42 6 morph @(
            turtle polygon -42 6
            turtle polygon 42 6
            turtle polygon -42 6
        )
    .EXAMPLE    
        # If we want to morph a smaller shape into a bigger shape,
        # 
        # we can duplicate lines
        turtle polygon 21 6 morph @(
            turtle @('forward', 21,'backward', 21 * 3)
            turtle polygon 21 6
            turtle @('forward', 21,'backward', 21 * 3)
        )                
    .EXAMPLE
        # We can repeat steps by multiplying arrays.
        # Lets repeat a hexagon three times with a rotation
        turtle ('polygon', 23, 6, 'rotate', -120 * 3)
    .EXAMPLE
        # Let's change the angle a bit and see how they overlap        
        turtle ('polygon', 23, 6, 'rotate', -60 * 6)
    .EXAMPLE
        # Let's do the same thing, but with a smaller angle
        turtle ('polygon', 23, 6, 'rotate', -40 * 9)
    .EXAMPLE
        # A flower is a series of repeated polygons and rotations
        turtle Flower    
    .EXAMPLE
        # Flowers look pretty with any number of polygons
        turtle Flower 50 10 (3..12 | Get-Random) 36
    .EXAMPLE
        # Flowers get less dense as we increase the angle and decrease the repetitions
        turtle Flower 50 15 (3..12 | Get-Random) 24
    .EXAMPLE
        # Flowers get more dense as we decrease the angle and increase the repetitions.
        turtle Flower 50 5 (3..12 | Get-Random) 72
    .EXAMPLE        
        # Flowers look especially beautiful as they morph
        $sideCount = (3..12 | Get-Random)        
        turtle Flower 50 15 $sideCount 36 morph @(
            turtle Flower 50 10 $sideCount 72
            turtle rotate (Get-Random -Max 360 -Min 180) Flower 50 5 $sideCount 72
            turtle Flower 50 10 $sideCount 72
        )        
    .EXAMPLE
        # We can draw a pair of arcs and turn back after each one.        
        # We call this a 'petal'.
        turtle rotate -30 Petal 42 60
    .EXAMPLE
        # We can construct a flower out of petals
        turtle FlowerPetal
    .EXAMPLE
        # Adjusting the angle of the petal makes our petal wider or thinner
        turtle FlowerPetal 42 15 (20..60 | Get-Random) 24
    .EXAMPLE
        # Flower Petals get more dense as we decrease the angle and increase repetitions 
        turtle FlowerPetal 42 10 (10..50 | Get-Random) 36
    .EXAMPLE
        # Flower Petals get less dense as we increase the angle and decrease repetitions
        turtle FlowerPetal 50 20 (20..72 | Get-Random) 18
    .EXAMPLE
        # Flower Petals look amazing when morphed
        $Radius = 23..42 | Get-Random
        $flowerAngle = 30..60 | Get-Random
        $AngleFactor = 2..6 | Get-Random
        $StepCount = 36
        $flowerPetals = turtle rotate (
            (Get-Random -Max 180) * -1
        ) flowerPetal $radius 10 $flowerAngle $stepCount    
        $flowerPetals2 = turtle rotate (
            (Get-Random -Max 180)
        ) flowerPetal $radius (
            10 * $AngleFactor
        ) $flowerAngle $stepCount
        turtle flowerPetal $radius 10 $flowerAngle $stepCount morph (
            $flowerPetals, 
            $flowerPetals2,
            $flowerPetals
        )
    .EXAMPLE
        # We can construct a 'scissor' by drawing two lines at an angle
        turtle Scissor 42 60
    .EXAMPLE
        # Drawing a scissor does not change the heading
        # So we can create a zig-zag pattern by multiply scissors
        turtle @('Scissor',42,60 * 4)
    .EXAMPLE
        # Getting a bit more interesting, we can create a polygon out of scissors
        # We will continually rotate until we have turned a multiple of 360 degrees.
        Turtle ScissorPoly 23 90 120
    .EXAMPLE
        Turtle ScissorPoly 23 60 72
    .EXAMPLE
        # This can get very chaotic, if it takes a while to reach a multiple of 360
        # Build N scissor polygons
        foreach ($n in 60..72) {
            Turtle ScissorPoly 16 $n $n
        }
    .EXAMPLE
        Turtle ScissorPoly 16 69 69
    .EXAMPLE
        # We can draw an outward spiral by growing a bit each step
        turtle StepSpiral
    .EXAMPLE
        turtle StepSpiral 42 120 4 18
    .EXAMPLE
        # Because Step Spirals are a fixed number of steps,        
        # they are easy to morph.
        turtle StepSpiral 42 120 4 18 morph @(
            turtle StepSpiral 42 90 4 24
            turtle StepSpiral 42 120 4 24
            turtle StepSpiral 42 90 4 24            
        )
    .EXAMPLE
        turtle @('StepSpiral',3, 120, 'rotate',60 * 6)
    .EXAMPLE
        turtle @('StepSpiral',3, 90, 'rotate',90 * 4)
    .EXAMPLE
        # Step spirals look lovely when morphed
        #
        # (especially when reversing angles)
        turtle @('StepSpiral',3, 120, 'rotate',60 * 6) morph @(
            turtle @('StepSpiral',3, 120, 'rotate',60 * 6)
            turtle @('StepSpiral',6, -120, 'rotate',120 * 6)
            turtle @('StepSpiral',3, 120, 'rotate',60 * 6)
        )
    .EXAMPLE        
        # When we reverse the spiral angle, the step spiral curve flips
        turtle @('StepSpiral',3, 90, 'rotate',90 * 4) morph @(
            turtle @('StepSpiral',3, 90, 'rotate',90 * 4)
            turtle @('StepSpiral',3, -90, 'rotate',90 * 4)
            turtle @('StepSpiral',3, 90, 'rotate',90 * 4)
        )
    .EXAMPLE
        # When we reverse the rotation, the step spiral curve slides
        turtle @('StepSpiral',3, 90, 'rotate',90 * 4) morph @(
            turtle @('StepSpiral',3, 90, 'rotate',90 * 4)
            turtle @('StepSpiral',3, 90, 'rotate',-90 * 4)
            turtle @('StepSpiral',3, 90, 'rotate',90 * 4)
        )
    .EXAMPLE
        # We we alternate, it looks amazing
        turtle @('StepSpiral',3, 90, 'rotate',90 * 4) morph @(
            turtle @('StepSpiral',3, 90, 'rotate',90 * 4)
            turtle @('StepSpiral',3, 90, 'rotate',-90 * 4)
            turtle @('StepSpiral',3, 90, 'rotate',90 * 4)
            turtle @('StepSpiral',3, -90, 'rotate',90 * 4)
            turtle @('StepSpiral',3, 90, 'rotate',90 * 4)            
        )
    .EXAMPLE        
        turtle @('StepSpiral',3, 120, 'rotate',60 * 6) morph @(
            turtle @('StepSpiral',3, 120, 'rotate',60 * 6)
            turtle @('StepSpiral',6, -120, 'rotate',120 * 6)
            turtle @('StepSpiral',3, 120, 'rotate',60 * 6)
            turtle @('StepSpiral',6, 120, 'rotate',-120 * 6)
            turtle @('StepSpiral',3, 120, 'rotate',60 * 6)
        )
    .EXAMPLE
        turtle spirolateral
    .EXAMPLE
        turtle spirolateral 50 60 10
    .EXAMPLE
        turtle spirolateral 50 120 6 @(1,3)            
    .EXAMPLE
        turtle spirolateral 23 144 8
    .EXAMPLE
        turtle spirolateral 23 72 8    
    .EXAMPLE
        # Turtle can draw a number of fractals        
        turtle BoxFractal 42 4
    .EXAMPLE
        # We can make a Board Fractal
        turtle BoardFractal 42 4
    .EXAMPLE
        # We can make a Crystal Fractal
        turtle CrystalFractal 42 4
    .EXAMPLE
        # We can make ring fractals
        turtle RingFractal 42 4
    .EXAMPLE
        # We can make a Pentaplexity
        turtle Pentaplexity 42 3
    .EXAMPLE
        # We can make a Triplexity
        turtle Triplexity 42 4
    .EXAMPLE
        # We can draw the Koch Island 
        turtle KochIsland 42 4
    .EXAMPLE
        # Or we can draw the Koch Curve
        turtle KochCurve 42 
    .EXAMPLE
        # We can make a Koch Snowflake
        turtle KochSnowflake 42 
    .EXAMPLE
        # We can draw the Levy Curve
        turtle LevyCurve 42 6
    .EXAMPLE
        # We can use a Hilbert Curve to fill a space
        Turtle HilbertCurve 42 4
    .EXAMPLE
        # We can use a Moore Curve to fill a space with a bit more density.
        turtle MooreCurve 42 4
    .EXAMPLE
        # We can show a binary tree
        turtle BinaryTree 42 4
    .EXAMPLE
        # We can also mimic plant growth
        turtle FractalPlant 42 4
    .EXAMPLE
        # The SierpinskiArrowHead Curve is pretty          
        turtle SierpinskiArrowheadCurve 42 4
    .EXAMPLE
        # The SierpinskiTriangle is a Fractal classic    
        turtle SierpinskiTriangle 42 4
    .EXAMPLE
        # Let's draw two reflected Sierpinski Triangles
        turtle rotate 60 SierpinskiTriangle 42 4 SierpinskiTriangle -42 4
    .EXAMPLE
        # We can draw a 'Sierpinski Snowflake' with multiple Sierpinski Triangles.
        turtle @('rotate', 30, 'SierpinskiTriangle',42,4 * 12)
    .EXAMPLE        
        turtle @('rotate', 45, 'SierpinskiTriangle',42,4 * 24)
    #>
    [CmdletBinding(PositionalBinding=$false)]
    [Alias('turtle')]
    param(
    # The arguments to pass to turtle.
    [ArgumentCompleter({
        param ( $commandName, $parameterName, $wordToComplete, $commandAst, $fakeBoundParameters )
        if (-not $script:TurtleTypeData) {
            $script:TurtleTypeData = Get-TypeData -TypeName Turtle
        } 
        $memberNames = @($script:TurtleTypeData.Members.Keys)
                
        if ($wordToComplete) {
            return $memberNames -like "$wordToComplete*"
        } else {
            return $memberNames
        }
    })]
    [Parameter(ValueFromRemainingArguments)]
    [PSObject[]]
    $ArgumentList,

    # Any input object to process.
    # If this is already a turtle object, the arguments will be applied to this object.
    # If the input object is not a turtle object, it will be ignored and a new turtle object will be created.
    [Parameter(ValueFromPipeline)]
    [PSObject]
    $InputObject
    )

    begin {
        # Get information about our turtle pseudo-type.
        $turtleType = Get-TypeData -TypeName Turtle
        # any member name is a potential command
        $memberNames = $turtleType.Members.Keys

        # We want to sort the member names by length, in case we need them in a pattern or want to sort quickly.
        $memberNames = $memberNames | Sort-Object @{Expression={ $_.Length };Descending=$true}, name
        # Create a new turtle object in case we have no turtle input.
        $currentTurtle = [PSCustomObject]@{PSTypeName='Turtle'}

        $invocationInfo = $MyInvocation
        $invocationInfo | 
            Add-Member ScriptProperty History {Get-History -Id $this.HistoryId} -Force 
    }

    process {        
        if ($PSBoundParameters.InputObject -and 
            $PSBoundParameters.InputObject.pstypenames -eq 'Turtle') {
            $currentTurtle = $PSBoundParameters.InputObject
        } elseif ($PSBoundParameters.InputObject) {
            # If input was passed, and it was not a turtle, pass it through.
            return $PSBoundParameters.InputObject
        }

        if (-not $currentTurtle.Invocations) {
            $currentTurtle | Add-Member NoteProperty Invocations -Force @(,$invocationInfo) 
        } elseif ($currentTurtle.Invocations -is [object[]]) {
            $currentTurtle.Invocations += $invocationInfo
        }


        # First we want to split each argument into words.
        # This way, it is roughly the same if you say:
        # * `turtle 'forward 10'`
        # * `turtle forward 10`
        # * `turtle 'forward', 10`
        $wordsAndArguments = @(foreach ($arg in $ArgumentList) {
            # If the argument is a string, and it starts with whitespace
            if ($arg -is [string]) {
                if ($arg -match '^[\r\n\s]+') {
                    $arg -split '\s{1,}'
                } else {
                    $arg
                }                
            }  else {
                # otherwise, leave the argument alone.
                $arg
            }
        })

        # Now that we have a series of words, we can process them.
        # We want to keep track of the current member, 
        # and continue to the next word until we find a member name.        
        $currentMember = $null
        # We want to output the turtle by default, in case we were called with no parameters.
        $outputTurtle = $true

        # To do this in one pass, we will iterate through the words and arguments.
        # We use an indexed loop so we can skip past claimed arguments.
        for ($argIndex =0; $argIndex -lt $wordsAndArguments.Length; $argIndex++) {
            $arg = $wordsAndArguments[$argIndex]
            # If the argument is not in the member names list, we can complain about it.
            if ($arg -notin $memberNames) {                
                if (-not $currentMember -and $arg -is [string] -and "$arg".Trim()) {
                    Write-Warning "Unknown command '$arg'."
                }
                continue
            }
            
            # If we have a current member, we can invoke it or get it.
            $currentMember = $arg
            # We can also begin looking for arguments 
            for (
                # at the next index.
                $methodArgIndex = $argIndex + 1; 
                # We will continue until we reach the end of the words and arguments,
                $methodArgIndex -lt $wordsAndArguments.Length -and 
                $wordsAndArguments[$methodArgIndex] -notin $memberNames; 
                $methodArgIndex++) {
            }
            # Now we know how long it took to get to the next member name.

            # And we can determine if we have any parameters.
            # (it is important that we always force any parameters into an array)
            $argList = 
                @(if ($methodArgIndex -ne ($argIndex + 1)) {
                    $wordsAndArguments[($argIndex + 1)..($methodArgIndex - 1)]
                    $argIndex = $methodArgIndex - 1
                })

            # Look up the member information for the current member.
            $memberInfo = $turtleType.Members[$currentMember]
            # If it's an alias
            if ($memberInfo.ReferencedMemberName) {
                # try to resolve it.
                $currentMember = $memberInfo.ReferencedMemberName
                $memberInfo = $turtleType.Members[$currentMember]
            }

            
            # Now we want to get the output from the step.
            $stepOutput =
                if (
                    # If the member is a method, let's invoke it.
                    $memberInfo -is [Management.Automation.Runspaces.ScriptMethodData] -or 
                    $memberInfo -is [Management.Automation.PSMethod]
                ) {                    
                    # If we have arguments,
                    if ($argList) {
                        # and we have a script method
                        if ($memberInfo -is [Management.Automation.Runspaces.ScriptMethodData]) {
                            # set this to the current turtle
                            $this = $currentTurtle
                            # and call the script, splatting positional parameters
                            # (this allows more complex binding, like ValueFromRemainingArguments)
                            . $currentTurtle.$currentMember.Script @argList
                        } else {
                            # Otherwise, we pass the parameters directly to the method                            
                            $currentTurtle.$currentMember.Invoke($argList)
                        }
                        
                    } else {
                        # otherwise, just invoke the method with no arguments.
                        $currentTurtle.$currentMember.Invoke()
                    }                    
                } else {
                    # If the member is a property, we can get it or set it.

                    # If we have any arguments,
                    if ($argList) {
                        # Check to see if they are strongly typed
                        if ($memberInfo -is [Management.Automation.Runspaces.ScriptPropertyData]) {
                            $desiredType = $memberInfo.SetScriptBlock.Ast.ParamBlock.Parameters.StaticType
                            if ($desiredType -is [Type] -and
                                $argList.Length -eq 1 -and
                                $argList[0] -as $desiredType) {
                                $argList = $argList[0] -as $desiredType
                            }
                        }
                        # lets try to set it.
                        $currentTurtle.$currentMember = $argList
                    } else {
                        # otherwise, lets get the property
                        $currentTurtle.$currentMember
                    }
                }

            # If the output is not a turtle object, we can output it.
            # NOTE: This may lead to multiple types of output in the pipeline.
            # Luckily, this should be one of the few cases where this does not annoy too much.
            # Properties being returned will largely be strings or numbers, and these will always output directly.
            if ($null -ne $stepOutput -and -not ($stepOutput.pstypenames -eq 'Turtle')) {
                # Output the step
                $stepOutput
                # and set the output turtle to false.
                $outputTurtle = $false
            } elseif ($null -ne $stepOutput) {
                # Set the current turtle to the step output.
                $currentTurtle = $stepOutput
                # and output it later (presumably).
                $outputTurtle = $true
            }
        }

        # If the last members returned a turtle object, we can output it.
        if ($outputTurtle) {
            return $currentTurtle
        }        
    }
}
