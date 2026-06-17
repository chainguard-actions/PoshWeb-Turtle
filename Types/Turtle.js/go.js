function go() {
    const parsedArgs = this.parse.call(this, ...arguments)
    let $this = this
    for (let parsed of parsedArgs) {
        let result = $this[parsed.method](...parsed.arguments)
    }
}