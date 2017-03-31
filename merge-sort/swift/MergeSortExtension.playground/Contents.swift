import UIKit

// Now let's do it with a more Swifty Array Extension
extension Array where Element: Comparable {
    func mergeSort() -> Array {
        guard self.count > 1 else {
            return self
        }
        let middle = self.count / 2
        var leftArray = Array(self[0..<middle])
        var rightArray = Array(self[middle..<self.count])
        leftArray = leftArray.mergeSort()
        rightArray = rightArray.mergeSort()
        return merge(left: leftArray, right: rightArray)
    }
    
    private func merge(left: Array, right: Array) -> Array {
        var leftIndex = 0
        var rightIndex = 0
        var sorted: Array = []
        
        while leftIndex < left.count, rightIndex < right.count {
            if left[leftIndex] < right[rightIndex] {
                sorted.append(left[leftIndex])
                leftIndex += 1
            } else {
                sorted.append(right[rightIndex])
                rightIndex += 1
            }
        }
        while leftIndex < left.count {
            sorted.append(left[leftIndex])
            leftIndex += 1
        }
        while rightIndex < right.count {
            sorted.append(right[rightIndex])
            rightIndex += 1
        }
        return sorted
    }
}

func mergeSortTest(){
    let empty: [Int] = []
    let one = [1]
    let sorted = [1,2,3,4,5,6,7,8,9]
    let test1 = [1,8,2,9,3,7,4,5,6]
    let reverse = [9,8,7,6,5,4,3,2,1]
    let duplicates = [9,5,1,2,0,5,1]
    let duplicatesSorted = [0,1,1,2,5,5,9]
    
    assert(empty.mergeSort() == [])
    assert(one.mergeSort() == one)
    assert(test1.mergeSort() == sorted)
    assert(reverse.mergeSort() == sorted)
    assert(duplicates.mergeSort() == duplicatesSorted)
}

mergeSortTest()
