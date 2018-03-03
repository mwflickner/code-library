function StackES5 (){
	this.data = []
}
StackES5.prototype.size = function (){
	return this.data.length;
}
StackES5.prototype.push = function (item){
	this.data.push(item);
}
StackES5.prototype.pop = function (item){
	this.data.pop(item);
}
StackES5.prototype.peek = function (){
	return this.data[this.data.length-1];
}

var s = new StackES5();
s.push(1);
s.push(2);
s.push(3);
console.log('3 should be ' + s.peek());
s.pop();
console.log('2 should be ' + s.peek());
console.log('2 should be ' + s.size());
