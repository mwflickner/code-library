import UIKit

extension Array where Element:Comparable {
    func insertionSort() -> Array {
        guard self.count > 1 else { return self }
        var array = self
        for (i, item) in array.enumerated() {
            var j = i
            while j > 0 && item < array[j-1] {
                array[j] = array[j-1]
                j -= 1
            }
            array[j] = item
        }
        return array
    }
}

func insertionSortTests(){
    var empty: [Int] = []
    var one = [1]
    let sorted = [1,2,3,4,5,6,7,8,9]
    let test1 = [1,8,2,9,3,7,4,5,6]
    let reverse = [9,8,7,6,5,4,3,2,1]
    let duplicates = [9,5,1,2,0,5,1]
    let duplicatesSorted = [0,1,1,2,5,5,9]
    
    assert(empty.insertionSort() == [])
    assert(one.insertionSort() == [1])
    assert(test1.insertionSort() == sorted)
    assert(reverse.insertionSort() == sorted)
    assert(duplicates.insertionSort() == duplicatesSorted)
}

insertionSortTests()