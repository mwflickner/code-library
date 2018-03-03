class Stack
  def initialize()
    @data = []
  end
 
  def push(item)
    @data.push(item)
  end
 
  def pop()
    @data.pop()
  end
 
  def peek()
    @data[-1]
  end
 
  def size()
    @data.size
  end
end
 
s = Stack.new
s.push(1)
s.push(2)
s.push(3)
puts("3 should be #{s.peek()}")
s.pop()
puts("2 should be #{s.peek()}")
puts("2 should be #{s.size()}")