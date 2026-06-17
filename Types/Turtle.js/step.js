function step(dx,dy) {
    if (this.isPenDown) { this.steps.push(` l ${dx} ${dy} `) }
    else { this.steps.push(` m ${dx} ${dy} `) }
    this.x += dx; this.y += dy ; this.resize()
    return this
}

