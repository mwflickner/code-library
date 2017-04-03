//: Playground - noun: a place where people can play

import UIKit

class StackItem {
    var itemAbove: StackItem?
    var itemBelow: StackItem?
    private var data: Int?
    
    init(data: Int, itemAbove: StackItem? = nil, itemBelow: StackItem? = nil) {
        self.data = data
        self.itemAbove = itemAbove
        self.itemBelow = itemBelow
    }
    
    func getData() -> Int? {
        return data
    }
}

class Stack {
    private var top: StackItem?
    private var count: Int = 0
    
    init(){
        
    }
    
    func getCount() -> Int {
        return count
    }
    
    func push(item: StackItem){
        item.itemBelow = top
        if top != nil {
            top?.itemAbove = item
        }
        top = item
        count += 1
    }
    
    func pop() -> Int? {
        let poppedItem = top
        top = top?.itemBelow
        count = poppedItem != nil ? count - 1 : count
        return poppedItem?.getData()
    }
    
    func peak() -> Int? {
        return top?.getData()
    }
    
    func clear(){
        while top != nil {
            top = top?.itemBelow
        }
        count = 0
    }
}

func stackTests(){
    let stack = Stack()
    assert(stack.getCount() == 0)
    assert(stack.peak() == nil)
    assert(stack.pop() == nil)
    let one = StackItem(data: 1)
    let two = StackItem(data: 2)
    let three = StackItem(data: 3)
    stack.push(item: one)
    assert(stack.getCount() == 1)
    assert(stack.peak()! == one.getData())
    stack.push(item: two)
    assert(stack.getCount() == 2)
    assert(stack.peak()! == two.getData())
    assert(stack.pop() == two.getData())
    assert(stack.getCount() == 1)
    stack.push(item: three)
    assert(stack.getCount() == 2)
    assert(stack.peak() == three.getData())
    stack.clear()
    assert(stack.getCount() == 0)
}

stackTests()
