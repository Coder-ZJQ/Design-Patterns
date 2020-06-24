import Foundation

protocol Product {
    func doStuff()
}

protocol Creator {
    func someOperation()
    func createProduct() -> Product
}

extension Creator {
    func someOperation() {
        createProduct().doStuff()
    }
}

class ConcreteCreatorA: Creator {
    func createProduct() -> Product {
        return ConcreteProductA()
    }
}

class ConcreteCreatorB: Creator {
    func createProduct() -> Product {
        return ConcreteProductB()
    }
}

class ConcreteProductA: Product {
    func doStuff() {
        print("ConcreteProductA created")
    }
}

class ConcreteProductB: Product {
    func doStuff() {
        print("ConcreteProductB created")
    }
}

ConcreteCreatorA().someOperation()
ConcreteCreatorB().someOperation()



