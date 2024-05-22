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

def reverse_list(head)
  return head if head.nil? || head.next.nil?

  new_head = reverse_list(head.next)
  head.next.next = head
  head.next = nil
  new_head
end

def addOneTOLL(head)
  carry = 1
  carry = rec(head, carry)
  if carry == 1
    return Node.new(1, head)
  end
  return head
end

def rec(temp, carry)
  if temp == nil
    return 1
  end
  carry = rec(temp.next, carry)
  value = temp.value + carry
  if value == 10
    temp.value = 0
    return carry
  else
    temp.value = value
    return 0
  end

end

head = convertToLL([9,9,9])
head = addOneTOLL(head)
print_list(head)