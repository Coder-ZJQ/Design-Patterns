/*:
 ### 工厂方法模式:
 *工厂方法模式*是一种创建型设计模式， 其在父类中提供一个创建对象的方法， 允许子类决定实例化对象的类型。
 */

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



