import Foundation

protocol Builder {
    func reset()
    func buildStepA()
    func buildStepB()
    func buildStepC()
}

class Product {
    private var parts = [String]()
    
    func add(part: String) {
        parts.append(part)
    }
    
    func listParts() -> String {
        return "Product parts: " + parts.joined(separator: ", ") + "\n"
    }
}

class ConcreteBuilder: Builder {
    private var product = Product()
    func reset() {
        product = Product()
    }
    
    func buildStepA() {
        product.add(part: "part A")
    }
    
    func buildStepB() {
        product.add(part: "part B")
    }
    
    func buildStepC() {
        product.add(part: "part C")
    }
    
    func retrieveProduct() -> Product {
        let result = product
        reset()
        return result
    }
}

class Director {
    private var builder: Builder?
    
    func update(builder: Builder) {
        self.builder = builder
    }
    
    func buildMinimalViableProduct() {
        builder?.buildStepA()
    }
    
    func buildFullFeaturedProduct() {
        builder?.buildStepA()
        builder?.buildStepB()
        builder?.buildStepC()
    }
}


let builder = ConcreteBuilder()
let director = Director()
director.update(builder: builder)

print("Standard basic product:")
director.buildMinimalViableProduct()
print(builder.retrieveProduct().listParts())

print("Standard full featured product:")
director.buildFullFeaturedProduct()
print(builder.retrieveProduct().listParts())

print("Custom product:")
builder.buildStepB()
builder.buildStepC()
builder.buildStepA()
print(builder.retrieveProduct().listParts())



