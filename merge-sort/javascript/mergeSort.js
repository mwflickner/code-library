class MergeSort {
  static sortList(list){
    if(list.length < 2){
      return list;
    }
    var middle = list.length / 2,
    leftSide = list.slice(0, middle),
    rightSide = list.slice(middle, list.length);
    leftSide = MergeSort.sortList(leftSide);
    rightSide = MergeSort.sortList(rightSide);
    return merge(leftSide, rightSide);
  }
}

module.exports = MergeSort;

var merge = (left, right) => {
  var leftIndex = 0,
    rightIndex = 0,
    sorted = [];
  while(leftIndex < left.length && rightIndex < right.length){
    if(left[leftIndex] < right[rightIndex]){
      sorted.push(left[leftIndex]);
      leftIndex++;
    } else {
      sorted.push(right[rightIndex]);
      rightIndex++;
    }
  }
  while(leftIndex < left.length){
    sorted.push(left[leftIndex]);
    leftIndex++;
  }
  while(rightIndex < right.length){
    sorted.push(right[rightIndex]);
    rightIndex++;
  }
  return sorted;
}


var array = [5, 2, 4, 3, 8];
console.log(array)
var sortedArray = MergeSort.sortList(array);
console.log(sortedArray);
