function forward(distance) {
    return this.step(
        distance * Math.cos(this.heading * Math.PI / 180),
        distance * Math.sin(this.heading * Math.PI / 180)
    )
}