function teleport(x,y) {
    var penState = this.penDown
    this.penDown = false
    this.step(x - this.x, y - this.y)
    this.penDown = penState
    return this
}