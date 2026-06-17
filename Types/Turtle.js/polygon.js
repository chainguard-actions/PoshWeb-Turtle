function polygon(size = 42, sides = 6) {
    let $this = this
    for (let side = 0; side < sides; side++) {
        $this = $this.forward(size).rotate(360/sides)
    }
    return $this
}