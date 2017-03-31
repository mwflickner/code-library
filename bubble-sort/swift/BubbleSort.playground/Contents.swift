import UIKit

func bubbleSort<T: Comparable>(array: inout [T]) -> [T] {
    guard array.count > 1 else {
        return array
    }
    for i in 0..<array.count {
        var swapOccured = false
        for j in 1..<array.count - i {
            if(array[j] < array[j-1]){
                let temp = array[j]
                array[j] = array[j-1]
                array[j-1] = temp
                swapOccured = true
            }
        }
        guard swapOccured else {
            break
        }
    }
    return array
}

func bubbleSort2<T: Comparable>(array: inout [T]) -> [T] {
    guard array.count > 1 else {
        return array
    }
    while true {
        var swapOccured = false
        for j in 0..<array.count - 1 {
            if(array[j] > array[j+1]){
                let temp = array[j]
                array[j] = array[j+1]
                array[j+1] = temp
                swapOccured = true
            }
        }
        guard swapOccured else {
            return array
        }
    }
}

struct BubbleSortTests {
    static var empty: [Int] = []
    static var one = [1]
    static var test1 = [1,8,2,9,3,7,4,5,6]
    static var reverse = [9,8,7,6,5,4,3,2,1]
    static var duplicates = [9,5,1,2,0,5,1]
    static let sorted = [1,2,3,4,5,6,7,8,9]
    static let duplicatesSorted = [0,1,1,2,5,5,9]
    
    private static func bubbleSort1Tests(){
        assert(bubbleSort(array: &empty) == empty)
        assert(bubbleSort(array: &one) == one)
        assert(bubbleSort(array: &test1) == sorted)
        assert(bubbleSort(array: &reverse) == sorted)
        assert(bubbleSort(array: &duplicates) == duplicatesSorted)
    }
    
    private static func bubbleSort2Tests(){
        assert(bubbleSort2(array: &empty) == empty)
        assert(bubbleSort2(array: &one) == one)
        assert(bubbleSort2(array: &test1) == sorted)
        assert(bubbleSort2(array: &reverse) == sorted)
        assert(bubbleSort2(array: &duplicates) == duplicatesSorted)
    }
    
    static func runTests(){
        bubbleSort1Tests()
        bubbleSort2Tests()
    }
    
}


BubbleSortTests.runTests()