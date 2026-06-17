function set_heading(value) {
    const _ = this
    try {
        _['#heading'] = new Number(value)
    } catch {
        _['#heading'] = 0.0
    }
    return _
}