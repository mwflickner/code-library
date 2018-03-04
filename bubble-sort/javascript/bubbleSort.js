var assert = require('assert');

class BubbleSort {
  static getSortedList(unsortedList){
    if(!Array.isArray(theList)){
      throw TypeError("Data provided is not an array");
    }
    if(theList.length < 2){
      return theList;
    }
    for(var i = 0; i<theList.length; i++){
      var swapOccured = false;
      for(var j = 1; j<theList.length - i; j++){
        if(theList[j] < theList[j-1]){
          var temp = theList[j];
          theList[j] = theList[j-1];
          theList[j-1] = temp;
          swapOccured = true;
        }
      }
      if(!swapOccured){
        break;
      }
    }
    return theList;
  }
}

var aList = [8, 3, 5, 1, 3, 9, 7],
aSortedList = BubbleSort.getSortedList(aList);
// Both should be sorted
console.log(aList);
console.log(aSortedList);
