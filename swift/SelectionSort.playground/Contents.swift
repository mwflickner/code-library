import UIKit

func selectionSort<T: Comparable>(array: inout [T]) -> [T] {
    guard array.count > 1 else {
        return array
    }
    for i in 0..<array.count - 1 {
        for j in i+1..<array.count {
            if(array[j] < array[i]){
                let temp = array[j]
                array[j] = array[i]
                array[i] = temp
            }
            print(array)
        }
    }
    return array
}

func selectionSortTests(){
    var empty: [Int] = []
    var one = [1]
    let sorted = [1,2,3,4,5,6,7,8,9]
    var test1 = [1,8,2,9,3,7,4,5,6]
    var reverse = [9,8,7,6,5,4,3,2,1]
    var duplicates = [9,5,1,2,0,5,1]
    let duplicatesSorted = [0,1,1,2,5,5,9]
    
    assert(selectionSort(array: &empty) == empty)
    assert(selectionSort(array: &one) == one)
    assert(selectionSort(array: &test1) == sorted)
    assert(selectionSort(array: &reverse) == sorted)
    assert(selectionSort(array: &duplicates) == duplicatesSorted)
}

selectionSortTests()