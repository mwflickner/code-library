import Foundation

protocol Stack {
    associatedtype T
    func push(_ item: T)
    func pop() throws -> T
    func peek() throws -> T
    var size: Int { get }
    var isEmpty: Bool {get}
}

enum StackError: Error {
    case EmptyStack
}

class LinkedStack<T> : Stack {
    private class Node {
        var item: T
        var next: Node?
        
        init(_ item: T, _ next: Node?){
            self.item = item
            self.next = next
        }
    }
    
    private var top: Node?
    var size = 0
    var isEmpty: Bool {
        return top == nil
    }
    
    func push(_ item: T) {
        let newNode = Node(item, self.top)
        self.top = newNode
        self.size += 1
    }
    
    func pop() throws -> T {
        guard let topNode = self.top else {
            throw StackError.EmptyStack
        }
        self.top = topNode.next
        self.size -= 1
        return topNode.item
    }
    
    func peek() throws -> T {
        guard let topNode = self.top else {
            throw StackError.EmptyStack
        }
        return topNode.item
    }
}

class ArrayStack<T> : Stack {
    private var array: [T] = []
    var size: Int {
        return self.array.count
    }
    var isEmpty: Bool {
        return self.array.isEmpty
    }
    func push(_ item: T){
        self.array.insert(item, at: 0)
    }
    func pop() throws -> T {
        guard self.array.first != nil else {
            throw StackError.EmptyStack
        }
        return self.array.remove(at: 0)
    }
    func peek() throws -> T {
        guard let first = self.array.first else {
            throw StackError.EmptyStack
        }
        return first
    }

}

var linkedStack = LinkedStack<Int>()
var arrayStack = ArrayStack<Int>()

func stackTests<A: Stack>(_ stack: A) where A.T == Int {
    assert(stack.isEmpty)
    var size = stack.size
    while stack.size < 2 {
        stack.push(stack.size + 1)
        size += 1
        assert(!stack.isEmpty)
        assert(stack.size == size)
    }
    while !stack.isEmpty {
        do {
            let peek = try stack.peek()
            assert(peek == size)
            let pop = try stack.pop()
            assert(pop == size)
            size -= 1
            assert(size == stack.size)
        } catch {
            fatalError("Unexpected Throw")
        }
    }
    assert(stack.size == 0)
    do {
        try stack.pop()
    } catch StackError.EmptyStack {

    } catch {
        fatalError("Incorrect throw type \(error.localizedDescription)")
    }
    do {
        try stack.peek()
    } catch StackError.EmptyStack {

    } catch {
        fatalError("Incorrect throw type  \(error.localizedDescription)")
    }
    
    
}

stackTests(linkedStack)
stackTests(arrayStack)
print("tests passed")
