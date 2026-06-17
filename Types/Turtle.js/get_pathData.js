function get_pathData() {
    let startX = 0;
    let startY = 0;
    if (!this.min)  { this.min = { x: 0.0, y: 0.0}}
    if (!this.max)  { this.max = { x: 0.0, y: 0.0}}
    if (this.min.x < 0) {
        startX = (this.min.x) * -1
    }
    if (this.min.y < 0) {
        startY = (this.min.y) * -1
    }
    return `m ${startX} ${startY} ${this.steps?.join(' ')}`
}