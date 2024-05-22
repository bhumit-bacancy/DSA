require "byebug"
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

def removeHead(head)
  return head if (head == nil || head.next == nil)
  prev = head
  head = head.next
  prev.next = nil
  head.back = nil
  return head
end

def removeTail(head)
  return head if (head == nil || head.next == nil)
  temp = head
  while temp.next.next != nil do 
    temp = temp.next
  end
  temp.next.back = nil
  temp.next = nil
  return head
end

def removeK(head, k)
  return nil if head == nil
  cnt = 0 
  temp = head
  while temp != nil do 
    cnt += 1
    if cnt == k
      prev = temp.back
      front = temp.next
      if (prev == nil && front == nil)
        return nil
      elsif prev == nil
        head = removeHead(head)
      elsif front == nil
        head = removeTail(head)
      else
        prev.next = front
        front.back = prev
        temp.next = nil
        temp.back = nil
      end
      break
    end
    temp = temp.next
  end
  return head
end

def removeEl(temp)
  prev = temp.back
  front = temp.next

  if front == nil
    prev.next = nil
    temp.back = nil
    return
  end
  prev.next = front
  front.back = prev
  temp.next = nil
  temp.back = nil
  return
end


def insertBeforeHead(head, val)
  new_head = Node.new(val, head, nil)
  head.back = new_head
  return new_head
end

def insertBeforeTail(head, val)
  return insertBeforeHead(head, val) if (head.back == nil && head.next == nil)
  tail = head
  while tail.next != nil
    tail = tail.next
  end
  prev = tail.back
  new_node = Node.new(val, tail, prev)
  tail.back = new_node
  prev.next = new_node
  return head
end

def insertBeforeK(head, val, k)
  return insertBeforeHead(head, val) if (k == 1)
  temp = head
  cnt = 0
  while temp != nil
    cnt += 1
    if (cnt == k)
      break
    end
    temp = temp.next
  end
  prev = temp.back
  new_node = Node.new(val, temp, prev)
  temp.back = new_node
  prev.next = new_node
  return head
end

def insertBeforeNode(node, val)
  prev = node.back
  new_node = Node.new(val, node, prev)
  node.back = new_node
  prev.next = new_node
end

def reverseDLL(head)
  return head if head == nil || head.next == nil
  current = head
  last = nil
  while(current != nil) do
    last = current.back
    current.back = current.next
    current.next = last
    current = current.back
  end
  return last.back
end

arr = [2, 4, 5, 3]
head = convertToDLL(arr)
print_list(head)
# head = removeHead(head)
# print_list(head)

# head = removeTail(head)
# print_list(head)

# head = removeK(head, 5)
# print_list(head)
# head = removeK(head, 4)
# print_list(head)
# head = removeK(head, 2)
# print_list(head)

# removeEl(head.next.next.next)
# print_list(head)

# head = insertBeforeK(head, 23, 3)
# print_list(head)

head = reverseDLL(head)
print_list(head)
