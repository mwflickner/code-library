import UIKit

enum BinaryTree<T: Comparable> {
    typealias TreeDataType = T

    case empty
    indirect case node(BinaryTree, T, BinaryTree)
    
    var count: Int {
        switch self {
        case let .node(left, _, right):
            return left.count + right.count + 1
        case .empty: return 0
        }
    }
    
    var currentNodeValue: T? {
        switch self {
        case .empty: return nil
        case .node(_, let value, _):
            return value
        }
    }
    
    mutating func insert(_ valueToAdd: T){
        self = insert(valueToAdd)
    }
    
    private func insert(_ valueToAdd: T) -> BinaryTree<T> {
        switch self {
        case .node(var left, let value, var right):
            if valueToAdd < value {
                return .node(left.insert(valueToAdd), value, right)
            } else {
                return .node(left, value, right.insert(valueToAdd))
            }
        case .empty:
            return .node(.empty, valueToAdd, .empty)
        }
        
    }
    
    func search(_ valueToFind: T) -> BinaryTree? {
        switch self {
        case .empty:
            return nil
        case let .node(left, value, right):
            if valueToFind == value {
                return self
            }
            if valueToFind < value {
                return left.search(valueToFind)
            } else {
                return right.search(valueToFind)
            }
        }
    }
}

enum TraversalType {
    case preOrder
    case inOrder
    case postOrder
}

protocol Traversable {
    associatedtype TreeValueType
    func traverse(_ traversalType: TraversalType, _ action: (TreeValueType) -> Void)
}

extension BinaryTree: Traversable {
    
    var sortedArray: [T] {
        var sorted: [T] = []
        traverse(.inOrder){ value in
            sorted.append(value)
        }
        return sorted
    }
    
    func traverse(_ traversalType: TraversalType, _ action: (T) -> Void){
        switch traversalType {
        case .preOrder: preOrder(action)
        case .inOrder: inOrder(action)
        case .postOrder: postOrder(action)
        }
    }
    
    private func preOrder(_ action: (T) -> Void){
        switch self {
        case .empty: return
        case let .node(left, value, right):
            action(value)
            left.preOrder(action)
            right.preOrder(action)
        }
    }
    
    private func inOrder(_ action: (T) -> Void){
        switch self {
        case .empty: return
        case let .node(left, value, right):
            left.inOrder(action)
            action(value)
            right.inOrder(action)
        }
    }
    
    private func postOrder(_ action: (T) -> Void){
        switch self {
        case .empty: return
        case let .node(left, value, right):
            left.preOrder(action)
            right.preOrder(action)
            action(value)
        }
    }
}

extension BinaryTree: CustomStringConvertible {
    var description: String {
        switch self {
        case let .node(left, value, right):
            return "value: \(value) \n left = [" + left.description + "] \n right = [" + right.description + "]"
        case .empty:
            return ""
        }
    }
}

var binaryTree: BinaryTree<Int> = .empty
print(binaryTree.description)
binaryTree.insert(6)
binaryTree.insert(7)
binaryTree.insert(9)
binaryTree.insert(3)
binaryTree.insert(8)
binaryTree.insert(2)

assert(binaryTree.search(3)?.currentNodeValue == 3)
assert(binaryTree.search(16)?.currentNodeValue == nil)

print("Pre Order Traversal:")
binaryTree.traverse(.preOrder){ value in
    print(value)
}

print("In Order Traversal:" )
binaryTree.traverse(.inOrder){ value in
    print(value)
}

print("Post Order Traversal:")
binaryTree.traverse(.postOrder){ value in
    print(value)
}

print("Sorted Array: \(binaryTree.sortedArray)")
