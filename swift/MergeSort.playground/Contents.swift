import UIKit

func mergeSort<T: Comparable>(array: [T]) -> [T] {
    guard array.count > 1 else {
        return array
    }
    let middle = array.count / 2
    var leftArray: [T] = Array(array[0..<middle])
    var rightArray: [T] = Array(array[middle..<array.count])
    leftArray = mergeSort(array: leftArray);
    rightArray = mergeSort(array: rightArray);
    return merge(left: leftArray, right: rightArray)
}

func merge<T: Comparable>(left: [T], right: [T]) -> [T] {
    var leftIndex = 0
    var rightIndex = 0
    var sorted = [T]()
    
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


func mergeSortTest(){
    let empty: [Int] = []
    let one = [1]
    let sorted = [1,2,3,4,5,6,7,8,9]
    let test1 = [1,8,2,9,3,7,4,5,6]
    let reverse = [9,8,7,6,5,4,3,2,1]
    let duplicates = [9,5,1,2,0,5,1]
    let duplicatesSorted = [0,1,1,2,5,5,9]

    assert(mergeSort(array: empty) == empty)
    assert(mergeSort(array: one) == one)
    assert(mergeSort(array: test1) == sorted)
    assert(mergeSort(array: reverse) == sorted)
    assert(mergeSort(array: duplicates) == duplicatesSorted)
}

mergeSortTest()