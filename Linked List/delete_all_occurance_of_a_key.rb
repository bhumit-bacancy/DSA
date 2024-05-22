require "byebug"
include DLL
Node = Struct.new(:value, :next, :back)

def convertToDLL(arr)
  head = Node.new(arr[0])
  prev = head
  (1..(arr.length - 1)).each do |i|
    temp = Node.new(arr[i], nil, prev)
    prev.next = temp
    prev = temp
  end
  return head
end

def print_list(head)
  while head != nil
    print "#{head.value} -> "
    head = head.next
  end
  puts "nil"
end

def deleteKey(head, key)
  return nil if head == nil || (head.value == key && head.next == nil)
  temp = head
  prev = nil
  while temp != nil do
    if temp.value == key
      if temp.back == nil
        head = removeHead(head)
        temp = head
        next
      else
        prev.next = temp.next
        temp.next.back = prev if temp.next
      end
    else
      prev = temp
    end
    temp = temp.next
  end
  head
end

def removeHead(head)
  return head if (head == nil || head.next == nil)
  prev = head
  head = head.next
  prev.next = nil
  head.back = nil
  return head
end

head = convertToDLL([2,2,10,8,4,2,5,2])
head = deleteKey(head,2)
print_list(head)