import Foundation

class Context {
    private var state: State
    
    init(_ state: State) {
        self.state = state
        transitionTo(state: state)
    }
    
    func transitionTo(state: State) {
        print("Context: Transition to " + String(describing: state))
        self.state = state
        self.state.update(context: self)
    }
    
    func request1() {
        state.handle1()
    }
    
    func request2() {
        state.handle2()
    }
}

protocol State: class {
    func update(context: Context)
    
    func handle1()
    func handle2()
}

class BaseState: State {
    private(set) weak var context: Context?
    
    func update(context: Context) {
        self.context = context
    }
    
    func handle1() {
        
    }
    
    func handle2() {
        
    }
}

class ConcreteStateA: BaseState {
    override func handle1() {
        print("ConcreteStateA handles request1.")
        print("ConcreteStateA wants to change the state of the context.\n")
        context?.transitionTo(state: ConcreteStateB())
    }
    
    override func handle2() {
        print("ConcreteStateA handles request2.\n")
    }
}

class ConcreteStateB: BaseState {
    override func handle1() {
        print("ConcreteStateB handles request1.\n")
    }
    
    override func handle2() {
        print("ConcreteStateB handles request2.")
        print("ConcreteStateB wants to change the state of the context.\n")
        context?.transitionTo(state: ConcreteStateA())
    }
}

let context = Context(ConcreteStateA())
context.request1()
context.request2()
