import Foundation

class Target {
    func request() -> String {
        return "Target: The default target's behavior."
    }
}

class Adaptee {
    func specificRequest() -> String {
        return ".eetpadA eht fo roivaheb laicepS"
    }
}

class Adapter: Target {
    private var adaptee: Adaptee
    
    init(_ adaptee: Adaptee) {
        self.adaptee = adaptee
    }
    
    override func request() -> String {
        return "Adapter: (TRANSLATED) " + adaptee.specificRequest().reversed()
    }
}

let target = Target()
let adaptee = Adaptee()
let adapter = Adapter(adaptee)

print(target.request())
print(adaptee.specificRequest())
print(adapter.request())


