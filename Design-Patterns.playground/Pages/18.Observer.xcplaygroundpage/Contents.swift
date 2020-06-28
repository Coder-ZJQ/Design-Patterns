import Foundation

class Subject {
    var state: Int = {
        return Int(arc4random_uniform(10))
    }()
    
    private lazy var observers = [Observer]()
    
    func attach(_ observer: Observer) {
        print("Subject: Attached an observer.\n")
        observers.append(observer)
    }
    
    func detach(_ observer: Observer) {
        if let idx = observers.firstIndex(where: { $0 === observer }) {
            observers.remove(at: idx)
            print("Subject: Detached an observer.\n")
        }
    }
    
    func notify() {
        print("Subject: Notifying observers...\n")
        observers.forEach({ $0.update(subject: self) })
    }
    
    func someBusinessLogic() {
        print("\nSubject: I'm doing something important.\n")
        state = Int(arc4random_uniform(10))
        print("Subject: My state has just changed to: \(state)\n")
        notify()
    }
}

protocol Observer: class {
    func update(subject: Subject)
}

class ConcreteObserverA: Observer {
    func update(subject: Subject) {
        if subject.state < 3 {
            print("ConcreteObserverA: Reacted to the event.\n")
        }
    }
}

class ConcreteObserverB: Observer {
    func update(subject: Subject) {
        if subject.state >= 3 {
            print("ConcreteObserverB: Reacted to the event.\n")
        }
    }
}

let subject = Subject()

let observer1 = ConcreteObserverA()
let observer2 = ConcreteObserverB()

subject.attach(observer1)
subject.attach(observer2)

subject.someBusinessLogic()
subject.someBusinessLogic()

subject.detach(observer2)
subject.someBusinessLogic()

