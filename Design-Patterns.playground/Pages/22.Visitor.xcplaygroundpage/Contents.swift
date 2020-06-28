import Foundation

protocol Component {
    func accept(_ visitor: Visitor)
}

class ConcreteComponentA: Component {
    
    func accept(_ visitor: Visitor) {
        visitor.visitConcreteComponentA(element: self)
    }
    
    func exclusiveMethodOfConcreteComponentA() -> String {
        return "A"
    }
}

class ConcreteComponentB: Component {
    
    func accept(_ visitor: Visitor) {
        visitor.visitConcreteComponentB(element: self)
    }
    
    func specialMethodOfComponent() -> String {
        return "B"
    }
}

protocol Visitor {
    func visitConcreteComponentA(element: ConcreteComponentA)
    func visitConcreteComponentB(element: ConcreteComponentB)
}

class ConcreteVistor1: Visitor {
    func visitConcreteComponentA(element: ConcreteComponentA) {
        print(element.exclusiveMethodOfConcreteComponentA() + " + ConcreteVisitor1\n")
    }
    func visitConcreteComponentB(element: ConcreteComponentB) {
        print(element.specialMethodOfComponent() + " + ConcreteVisitor1\n")
    }
}

class ConcreteVistor2: Visitor {
    func visitConcreteComponentA(element: ConcreteComponentA) {
        print(element.exclusiveMethodOfConcreteComponentA() + " + ConcreteVisitor2\n")
    }
    func visitConcreteComponentB(element: ConcreteComponentB) {
        print(element.specialMethodOfComponent() + " + ConcreteVisitor2\n")
    }
}

let components: [Component] = [ConcreteComponentA(), ConcreteComponentB()]

print("The client code works with all visitors via the base Visitor interface:\n")
let visitor1 = ConcreteVistor1()
components.forEach({ $0.accept(visitor1) })

print("\nIt allows the same client code to work with different types of visitors:\n")
let visitor2 = ConcreteVistor2()
components.forEach({ $0.accept(visitor2) })
