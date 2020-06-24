import Foundation


protocol Handler: class {
    @discardableResult
    func setNext(handler: Handler) -> Handler
    
    func handle(request: String) -> String?
    
    var nextHandler: Handler? { get set }
}

extension Handler {
    func setNext(handler: Handler) -> Handler {
        self.nextHandler = handler
        return handler
    }
    
    func handle(request: String) -> String? {
        return nextHandler?.handle(request: request)
    }
}

class MonkeyHandler: Handler {
    var nextHandler: Handler?
    
    func handle(request: String) -> String? {
        if request == "Banana" {
            return "Monkey: I'll eat the " + request + ".\n"
        } else {
            return nextHandler?.handle(request: request)
        }
    }
}

class SquirrelHandler: Handler {
    var nextHandler: Handler?
    
    func handle(request: String) -> String? {
        if request == "Nut" {
            return "Squirrel: I'll eat the " + request + ".\n"
        } else {
            return nextHandler?.handle(request: request)
        }
    }
}

class DogHandler: Handler {
    var nextHandler: Handler?
    
    func handle(request: String) -> String? {
        if request == "MeatBall" {
            return "Dog: I'll eat the " + request + ".\n"
        } else {
            return nextHandler?.handle(request: request)
        }
    }
}

func testHandler(handler: Handler) {
    let food = ["Nut", "Banana", "Cup of coffee"]

    for item in food {
        print("Who wants a " + item + "?\n")
        guard let result = handler.handle(request: item) else {
            print(" " + item + " was left untouched.\n")
            return
        }
        print(" " + result)
    }
}

let monkey = MonkeyHandler()
let squirrel = SquirrelHandler()
let dog = DogHandler()

monkey.setNext(handler: squirrel).setNext(handler: dog)
print("Monkey > Squirrel > Dog\n\n")
testHandler(handler: monkey)
print()
print("Squirrel > Dog\n\n")
testHandler(handler: squirrel)

