import UIKit

extension Array where Element:Comparable {
    mutating func selectionSort() -> Array {
        guard self.count > 1 else {
            return self
        }
        for i in 0..<self.count - 1 {
            for j in i+1..<self.count {
                if(self[j] < self[i]){
                    let temp = self[j]
                    self[j] = self[i]
                    self[i] = temp
                }
                print(self)
            }
        }
        return self
    }
}

func selectionSortTests(){
    var empty: [Int] = []
    var one = [1]
    let sorted = [1,2,3,4,5,6,7,8,9]
    var test1 = [1,8,2,9,3,7,4,5,6]
    var reverse = [9,8,7,6,5,4,3,2,1]
    var duplicates = [9,5,1,2,0,5,1]
    let duplicatesSorted = [0,1,1,2,5,5,9]
    
    assert(empty.selectionSort() == [])
    assert(one.selectionSort() == [1])
    assert(test1.selectionSort() == sorted)
    assert(reverse.selectionSort() == sorted)
    assert(duplicates.selectionSort() == duplicatesSorted)
}

selectionSortTests()
