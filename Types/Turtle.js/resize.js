function resize() {
    if (this.x > this.max.x) { this.max.x = this.x }
    if (this.y > this.max.y) { this.max.y = this.y }
    if (this.x < this.min.x) { this.min.x = this.x }
    if (this.y < this.min.y) { this.min.y = this.y }
    this.width = this.max.x - this.min.x
    this.height = this.max.y - this.min.y
    return this
}