# Define a Node structure
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


# Create a function to print the elements of the list
def print_list(head)
  current = head
  while current
    print "#{current.value} -> "
    current = current.next
  end
  puts "nil"
end

def is_palindrome(head)
  temp = head
  arr = []
  while temp != nil do
      arr << temp.value
      temp = temp.next
  end
  arr == arr.reverse
end

# def reverse_list(head)
#   return head if head.nil? || head.next.nil?

#   new_head = reverse_list(head.next)
#   head.next.next = head
#   head.next = nil
#   new_head
# end

def reverse_k_group(head, k)
  first = head
  tail = head
  temp = head
  cnt = 1
  prev_tail = nil
  while temp != nil do
      if cnt == k
          next_first = temp.next
          temp.next = nil
          data = reverse_list(first)
          prev_tail.next = data[0] if prev_tail
          prev_tail = data[1]
          head = data[0] if first == head
          first = next_first
          cnt = 1
          temp = next_first
          next
        end
        temp = temp.next
        cnt += 1
  end
  byebug
  if cnt < k
    tail.next = next_first
  end
  head
end

def reverse_list(head)
return head if head.nil? || head.next.nil?

new_head = reverse_list(head.next)
head.next.next = head
head.next = nil
[new_head, head]
end


head = convertToLL([1,2,3,4])
# p is_palindrome(head)
# temp = head.next.next.next
head = reverse_k_group(head, 3)
# last_node.next = temp
puts print_list(head)



