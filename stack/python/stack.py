class Stack:
    def __init__(self):
        self.data = []

    def size(self):
        return len(self.data)

    def push(self, item):
        self.data.append(item)

    def pop(self):
        return self.data.pop()

    def peek(self):
        return self.data[-1]

    def clear(self):
        self.data = []

s = Stack()
assert s.size() is 0
s.push(1)
assert s.size() is 1
s.push(2)
s.push(3)
assert s.size() is 3
assert s.peek() is 3
s.pop()
assert s.peek() is 2
assert s.size() is 2
s.clear()
assert s.size() is 0
print 'All tests passed.'
