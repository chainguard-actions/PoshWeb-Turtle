function get_heading() {
    const _ = this
    if ( _['#heading'] === undefined ) {
        _['#heading'] = 0.0
    }
    return _['#heading']
}
