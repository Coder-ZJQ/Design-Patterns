import Foundation

class Flyweight {
    private let sharedState: [String]
    
    init(sharedState: [String]) {
        self.sharedState = sharedState
    }
    
    func operation(uniqueState: [String]) {
        print("Flyweight: Displaying shared (\(sharedState)) and unique (\(uniqueState)) state.\n")
    }
}

class FlyweightFactory {
    private var flyweights: [String: Flyweight]
    init(states: [[String]]) {
        var flyweights = [String: Flyweight]()
        for state in states {
            flyweights[state.key] = Flyweight(sharedState: state)
        }
        self.flyweights = flyweights
    }
    
    func flyweight(for state:[String]) -> Flyweight {
        let key = state.key
        
        guard let foundFlyweight = flyweights[key] else {
            print("FlyweightFactory: Can't find a flyweight, creating new one.\n")
            let flyweight = Flyweight(sharedState: state)
            flyweights.updateValue(flyweight, forKey: key)
            return flyweight
        }
        print("FlyweightFactoryL Reusing existing flyweight.\n")
        return foundFlyweight
    }
    
    func printFlyweight() {
        print("FlyweightFactory: I have \(flyweights.count) flyweights:\n")
        for item in flyweights {
            print(item.key)
        }
    }
}

extension Array where Element == String {
    var key: String {
        return self.joined(separator: ", ")
    }
}

func addCarToPoliceDatabase(
    _ factory: FlyweightFactory,
    _ plates: String,
    _ owner: String,
    _ brand: String,
    _ model: String,
    _ color: String) {
    print("Adding a car to database.\n")
    let flyweight = factory.flyweight(for: [brand, model, color])
    flyweight.operation(uniqueState: [plates, owner])
}

let array = [
    ["Chevrolet", "Camaro2018", "pink"],
    ["Mercedes Benz", "C300", "black"],
    ["Mercedes Benz", "C500", "red"],
    ["BMW", "M5", "red"],
    ["BMW", "X6", "white"]
]

let factory = FlyweightFactory(states: array)

factory.printFlyweight()

addCarToPoliceDatabase(factory, "CL234IR", "James Doe", "BMW", "M5", "red")
addCarToPoliceDatabase(factory, "CL234IR", "James Doe", "BMW", "X1", "red")
