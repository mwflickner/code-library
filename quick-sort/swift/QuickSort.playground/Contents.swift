import UIKit

extension Array where Element: Comparable {
    private mutating func quickSort(_ startIndex: Int, _ endIndex: Int){
        if startIndex < endIndex {
            let randomIndex = Int(arc4random_uniform(UInt32(endIndex - startIndex + 1))) + startIndex
            let pivot = self[Int(randomIndex)]
            let partitionIndex = self.partition(by: {$0 > pivot})
            quickSort(startIndex, partitionIndex - 1)
            quickSort(partitionIndex, endIndex)
        }
    }
    mutating func quickSort(){
        self.quickSort(0, self.count - 1)
    }
}

var list = [5,2,7,4,8,3]
print(list)
list.quickSort()
print(list)

