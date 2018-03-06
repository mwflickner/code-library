Array.prototype.insertionSort = function(){
  if(this.length < 2){
    return this;
  }
  for(var i=0; i<this.length; i++){
    var j = i;
    while(j > 0 && this[j] < this[j-1]){
      var jValue = this[j];
      this[j] = this[j-1];
      this[j-1] = jValue;
      j -= 1;
    }
  }
  return this;
}

var aList = [8, 3, 5, 1, 3, 9, 7];
aList.insertionSort();
console.log(aList);
