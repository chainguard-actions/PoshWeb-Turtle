# Turtle 101 - Intro to Turtles

# Turtle is a groovy graphics system that dates back to 1966.

# Imagine you are a turtle holding a pen.

# You can:
# * Turn
# * Move Forward
# * Pick up the pen

# Using these fundamental basics, we can theoretically draw any shape.

# Let's start simple, by drawing a line
turtle forward 42 save ./line.svg

# Let's draw a line and take a few turns
turtle forward 42 rotate 120 forward 42 rotate 120 forward 42 rotate 120 stroke '#4488ff' save ./triangle.svg

# Let's make a square
turtle forward 42 rotate 90 forward 42 rotate 90 forward 42 rotate 90 forward 42 rotate 90 stroke '#4488ff' save ./square.svg

# Now let's do it the easier way, with square
turtle square 42 stroke '#4488ff' save ./square2.svg

# Now let's do it the general way, with polygon
turtle polygon 42 4 stroke '#4488ff' save ./square4.svg

# Our turtle is pretty smart, and so it can draw a lot of shapes for us.

# A classic example is a 'flower', which repeats many polygons
turtle flower stroke '#4488ff' save ./flower.svg





