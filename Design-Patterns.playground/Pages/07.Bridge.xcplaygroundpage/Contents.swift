import Foundation

protocol Implementation {
    func operationImplementation() -> String
}

class Abstraction {
    fileprivate var implementation: Implementation
    
    init(_ implementation: Implementation) {
        self.implementation = implementation
    }
    
    func operation() -> String {
        let operation = implementation.operationImplementation()
        return "Abstraction: Base operation with:\n" + operation
    }
}

class ExtendedAbstraction: Abstraction {
    override func operation() -> String {
        let operation = implementation.operationImplementation()
        return "ExtendedAbstraction: Extended operation with:\n" + operation
    }
}

class ConcreteImplementationA: Implementation {
    func operationImplementation() -> String {
        return "ConcreteImplementationA: Here's the result on the platform A.\n"
    }
}

class ConcreteImplementationB: Implementation {
    func operationImplementation() -> String {
        return "ConcreteImplementationB: Here's the result on the platform B.\n"
    }
}

print(Abstraction(ConcreteImplementationA()).operation())
print(ExtendedAbstraction(ConcreteImplementationB()).operation())
