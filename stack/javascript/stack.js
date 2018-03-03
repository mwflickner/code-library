var assert = require('assert');

class Stack {
  constructor(){
    this.data = [];
  }

  get size(){
    return this.data.length;
  }

  push(item){
    this.data.push(item);
  }

  pop(item){
    return this.data.pop(item);
  }

  peek(item){
    return this.data[this.data.length - 1];
  }

  clear(){
    this.data = [];
  }
}

var s = new Stack();
assert(s.size === 0);
s.push(1)
assert(s.size === 1);
s.push(2)
assert(s.size === 2);
s.push(3)
assert(s.size === 3);
assert(s.peek() === 3);
s.pop()
assert(s.peek() === 2);
assert(s.size === 2);
s.clear();
assert(s.size === 0);
console.log('All tests passed');
