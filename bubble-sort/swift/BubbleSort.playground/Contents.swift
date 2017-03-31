import UIKit

extension Array where Element: Comparable {
    mutating func bubbleSort() -> Array {
        guard self.count > 1 else {
            return self
        }
        for i in 0..<self.count {
            var swapOccured = false
            for j in 1..<self.count - i {
                if(self[j] < self[j-1]){
                    let temp = self[j]
                    self[j] = self[j-1]
                    self[j-1] = temp
                    swapOccured = true
                }
            }
            guard swapOccured else {
                break
            }
        }
        return self
    }
}

func bubbleSortTests() {
    var empty: [Int] = []
    var one = [1]
    var test1 = [1,8,2,9,3,7,4,5,6]
    var reverse = [9,8,7,6,5,4,3,2,1]
    var duplicates = [9,5,1,2,0,5,1]
    let sorted = [1,2,3,4,5,6,7,8,9]
    let duplicatesSorted = [0,1,1,2,5,5,9]
    
    assert(empty.bubbleSort() == [])
    assert(one.bubbleSort() == [1])
    assert(test1.bubbleSort() == sorted)
    assert(reverse.bubbleSort() == sorted)
    assert(duplicates.bubbleSort() == duplicatesSorted)
}

bubbleSortTests()