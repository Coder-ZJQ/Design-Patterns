import Foundation

class BaseClass: NSCopying, Equatable {
    
    private var intValue = 1
    private var stringValue = "Value"
    
    required init(intValue: Int = 1, stringValue: String = "Value") {
        self.intValue = intValue
        self.stringValue = stringValue
    }
    
    func copy(with zone: NSZone? = nil) -> Any {
        let prototype = type(of: self).init()
        prototype.intValue = intValue
        prototype.stringValue = stringValue
        print("Values defined in BaseClass have been cloned!")
        return prototype
    }
    
    static func == (lhs: BaseClass, rhs: BaseClass) -> Bool {
        return lhs.intValue == rhs.intValue && lhs.stringValue == rhs.stringValue
    }
}

class SubClass: BaseClass {
    private var boolValue = true
    
    override func copy(with zone: NSZone? = nil) -> Any {
        guard let prototype = super.copy(with: zone) as? SubClass else {
            return SubClass()
        }
        prototype.boolValue = boolValue
        print("Values defined in SubClass have been cloned!")
        return prototype
    }
}

let original = SubClass(intValue: 2, stringValue: "Value2")
if let copy = original.copy() as? SubClass, original == copy {
    print("The original object is equal to the copied object!")
}
