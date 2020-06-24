import Foundation

class Singleton {
    static var shared: Singleton = {
        let instance = Singleton()
        return instance
    }()
    
    private init() { }
    
    func someBusinessLogin() -> String {
        return "Result of the 'someBusinessLogic' call"
    }
}

extension Singleton: NSCopying {
    func copy(with zone: NSZone? = nil) -> Any {
        return self
    }
}

let instance1 = Singleton.shared
let instance2 = Singleton.shared

if instance1 === instance2 {
    print("Singleton works, both variables contain the same instance.")
} else {
    print("Singleton failed, variables contain different instances.")
}
