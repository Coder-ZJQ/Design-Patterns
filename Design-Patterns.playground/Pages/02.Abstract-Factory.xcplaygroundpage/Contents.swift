import Foundation

protocol AbstractFactory {
    func createProductA() -> AbstractProductA
    func createProductB() -> AbstractProductB
}

protocol AbstractProductA {
    func doStuffA()
}

protocol AbstractProductB {
    func doStuffB()
}

class ConcreteProductA1: AbstractProductA {
    func doStuffA() {
        print("ConcreteProductA1 doStuffA")
    }
}

class ConcreteProductB1: AbstractProductB {
    func doStuffB() {
        print("ConcreteProductB1 doStuffB")
    }
}

class ConcreteProductA2: AbstractProductA {
    func doStuffA() {
        print("ConcreteProductA2 doStuffA")
    }
}

class ConcreteProductB2: AbstractProductB {
    func doStuffB() {
        print("ConcreteProductB3 doStuffB")
    }
}

class ConcreteFactory1: AbstractFactory {
    func createProductA() -> AbstractProductA {
        return ConcreteProductA1()
    }
    func createProductB() -> AbstractProductB {
        return ConcreteProductB1()
    }
}

class ConcreteFactory2: AbstractFactory {
    func createProductA() -> AbstractProductA {
        return ConcreteProductA2()
    }
    func createProductB() -> AbstractProductB {
        return ConcreteProductB2()
    }
}

ConcreteFactory1().createProductA().doStuffA()
ConcreteFactory1().createProductB().doStuffB()
ConcreteFactory2().createProductA().doStuffA()
ConcreteFactory2().createProductB().doStuffB()
