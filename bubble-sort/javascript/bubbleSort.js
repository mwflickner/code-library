Array.prototype.bubbleSort = function(){
  if(this.length < 2){
    return this;
  }
  for(var i = 0; i<this.length; i++){
    var swapOccured = false;
    for(var j = 1; j<this.length - i; j++){
      if(this[j] < this[j-1]){
        var temp = this[j];
        this[j] = this[j-1];
        this[j-1] = temp;
        swapOccured = true;
      }
    }
    if(!swapOccured){
      break;
    }
  }
  return this;
}

var aList = [8, 3, 5, 1, 3, 9, 7];
aList.bubbleSort();
console.log(aList);
