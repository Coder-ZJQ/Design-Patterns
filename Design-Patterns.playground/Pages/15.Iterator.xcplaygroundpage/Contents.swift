import Foundation

class WordsCollection {
    fileprivate lazy var items = [String]()
    
    func append(_ item: String) {
        self.items.append(item)
    }
}

extension WordsCollection: Sequence {

    func makeIterator() -> WordsInerator {
        return WordsInerator(self)
    }
}

class WordsInerator: IteratorProtocol {
    typealias Element = String
    
    private let collection: WordsCollection
    private var index = 0
    
    init(_ collection: WordsCollection) {
        self.collection = collection
    }
    
    func next() -> String? {
        defer {
            index += 1
        }
        return index < collection.items.count ? collection.items[index] : nil
    }
}

class NumbersCollection {
    fileprivate lazy var items = [Int]()
    
    func append(_ item: Int) {
        self.items.append(item)
    }
}

extension NumbersCollection: Sequence {
    func makeIterator() -> AnyIterator<Int> {
        var index = self.items.count - 1
        
        return AnyIterator { () -> Int? in
            defer { index -= 1 }
            return index >= 0 ? self.items[index] : nil
        }
    }
}


let words = WordsCollection()
words.append("First")
words.append("Second")
words.append("Third")
print("Straight traversal using IteratorProtocol:")
for item in words {
    print(item)
}

let numbers = NumbersCollection()
numbers.append(1)
numbers.append(2)
numbers.append(3)
print("\nReverse traversal using AnyIterator:")
for item in numbers {
    print(item)
}

