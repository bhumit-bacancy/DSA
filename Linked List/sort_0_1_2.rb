# Sort a LL of 0's 1's and 2's by changing links

Node = Struct.new(:value, :next)
require 'byebug'
# Create a function to add a new node to the end of the list
def convertToLL(arr)
  head = Node.new(arr[0])
  prev = head
  (1..(arr.length - 1)).each do |i|
    temp = Node.new(arr[i], nil)
    prev.next = temp
    prev = temp
  end
  return head
end

def print_list(head)
  current = head
  while current
    print "#{current.value} -> "
    current = current.next
  end
  puts "nil"
end

def sortLL(head)
  temp = head
  zero_head = Node.new(-1, nil)
  one_head = Node.new(-1, nil)
  two_head = Node.new(-1, nil)
  zero = zero_head
  one = one_head
  two = two_head
  while temp != nil do
    val = temp.value
    if val == 0
      zero.next = temp
      zero = temp
    elsif val == 1
      one.next = temp
      one = temp
    elsif val == 2
      two.next = temp
      two = temp
    end
    temp = temp.next
  end
  zero.next = one_head.next ? one_head.next : two_head.next
  one.next = two_head.next
  two.next = nil
  return zero_head.next
end

head = convertToLL([1,2,1,2,1,1])
head = sortLL(head)
print_list(head)