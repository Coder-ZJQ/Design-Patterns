import Foundation

protocol AbstractProtocol {
    
    func templateMethod()
    
    func baseOperations1()
    func baseOperations2()
    func baseOperations3()
    
    func requiredOperation1()
    func requiredOperation2()
    
    func hook1()
    func hook2()
    
}

extension AbstractProtocol {
    
    func templateMethod() {
        baseOperations1()
        requiredOperation1()
        baseOperations2()
        hook1()
        requiredOperation2()
        baseOperations3()
        hook2()
    }
    
    func baseOperations1() {
        print("AbstractProtocol says: I am doing the bulk of the work.\n")
    }
    func baseOperations2() {
        print("AbstractProtocol says: But I let subclasses override some operations.\n")
    }
    func baseOperations3() {
        print("AbstractProtocol says: But I am doing the bulk of the work anyway.\n")
    }
    
    func hook1() {
        
    }
    func hook2() {
        
    }
    
}

class ConcreteClass1: AbstractProtocol {
    func requiredOperation1() {
        print("ConcreteClass1 says: Implemented Operations1.\n")
    }
    func requiredOperation2() {
        print("ConcreteClass1 says: Implemented Operations2.\n")
    }
    func hook2() {
        print("ConcreteClass1 says: Overridden Hook2.\n")
    }
}

class ConcreteClass2: AbstractProtocol {
    func requiredOperation1() {
        print("ConcreteClass2 says: Implemented Operations1.\n")
    }
    func requiredOperation2() {
        print("ConcreteClass2 says: Implemented Operations2.\n")
    }
    func hook1() {
        print("ConcreteClass2 says: Overridden Hook1.\n")
    }
}

print("Same client code can work with different subclasses:\n")
ConcreteClass1().templateMethod()

print("\nSame client code can work with different subclasses:\n")
ConcreteClass2().templateMethod()
