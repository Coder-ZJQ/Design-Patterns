import Foundation

protocol Component {
    var parent: Component? { get set }
    func add(component: Component)
    func remove(component: Component)
    func isComposite() -> Bool
    func operation() -> String
}

extension Component {
    func add(component: Component) {}
    func remove(component: Component) {}
    func isComposite() -> Bool {
        return true
    }
}

class Leaf: Component {
    var parent: Component?
    func operation() -> String {
        return "Leaf"
    }
}

class Composite: Component {
    var parent: Component?
    private var children = [Component]()
    
    func add(component: Component) {
        var item = component
        item.parent = self
        children.append(item)
    }
    
    func remove(component: Component) {
        
    }
    
    func isComposite() -> Bool {
        return true
    }
    
    func operation() -> String {
        let result = children.map({ $0.operation() })
        return "Branch(" + result.joined(separator: " ") + ")"
    }
}


print(Leaf().operation())

let tree = Composite()

let branch1 = Composite()
branch1.add(component: Leaf())
branch1.add(component: Leaf())

let branch2 = Composite()
branch2.add(component: Leaf())
branch2.add(component: Leaf())

tree.add(component: branch1)
tree.add(component: branch2)

print(tree.operation())

tree.add(component: Leaf())

print(tree.operation())
