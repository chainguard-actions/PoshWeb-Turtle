function parse() {
    let _ = this        
    var memberNames = []    
    var objectPrototype = Object.getPrototypeOf(this)
    var propertyNames = Object.getOwnPropertyNames(this)
    var memberNameLookup = {} 
    for (let memberName of propertyNames) {
        if (memberName == "constructor") { continue }
        memberNameLookup[memberName.toUpperCase(memberName)] = memberName
    }

    const parsed = []

    const unbound = []

    nextArgument: for (let argNumber = 0 ; argNumber < arguments.length; argNumber++) {
        let arg = arguments[argNumber]
        
        if (typeof(arg) == "string" && ! memberNameLookup[arg.toUpperCase()]) {
            unbound.push(arg)
            continue nextArgument
        }
        
        if (typeof(arg) != "string") {
            unbound.push(arg)
            continue nextArgument
        }

        let memberName = arg.toUpperCase()
        let memberInfo = memberNameLookup[arg.toUpperCase()]
        let memberArgs = []
        lookingForParameters: for (
            let memberArgIndex = argNumber + 1; 
            memberArgIndex < arguments.length;
            memberArgIndex++
        ) {
            let memberArg = arguments[memberArgIndex]
            if (typeof(memberArg) == "string" && memberNameLookup[memberArg.toUpperCase()]) {
                argNumber = memberArgIndex  - 1
                break lookingForParameters
            }
            memberArgs.push(memberArg)
        }

        parsed.push({
            method: memberNameLookup[memberName],
            arguments: memberArgs
        })
    }

    return parsed
}