import Foundation

class Context {
    private var strategy: Strategy
    
    init(strategy: Strategy) {
        self.strategy = strategy
    }
    
    func update(strategy: Strategy) {
        self.strategy = strategy
    }
    
    func doSomeBusinessLogic() {
        print("Context: Sorting data using the strategy (not sure how it'll do it)\n")
        let result = strategy.doAlgorithm(["a", "b", "c", "d", "e"])
        print(result.joined(separator: ","))
    }
}

protocol Strategy {
    func doAlgorithm<C: Comparable>(_ data: [C]) -> [C]
}

class ConcreteStrategyA: Strategy {
    func doAlgorithm<C>(_ data: [C]) -> [C] where C : Comparable {
        return data.sorted()
    }
}

class ConcreteStrategyB: Strategy {
    func doAlgorithm<C>(_ data: [C]) -> [C] where C : Comparable {
        return data.sorted(by: >)
    }
}

let context = Context(strategy: ConcreteStrategyA())
print("Client: Strategy is set to normal sorting.\n")
context.doSomeBusinessLogic()

print("\nClient: Strategy is set to reverse sorting.\n")
context.update(strategy: ConcreteStrategyB())
context.doSomeBusinessLogic()
