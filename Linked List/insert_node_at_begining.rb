# Define a Node structure
require "byebug"
Node = Struct.new(:value, :next)

# Create a function to add a new node to the end of the list
def add_node_at_begining(head, value)
  if head.nil?
    return Node.new(value, nil)
  else
    current = Node.new(value, head)
   
    head = current
    return head
  end
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

def removeHead(head)
  return head if head == nil
  head = head.next
  return head
end

def removeTail(head)
  return head if (head == nil || head.next == nil)
  temp = head
  while temp.next.next != nil do 
    temp = temp.next
  end
  temp.next = nil
  return head
end


def removeK(head, k)
  return head if head == nil
  if k == 1
    head = head.next 
    return head
  end
  cnt = 0 
  temp = head
  prev = nil
  while temp != nil do 
    cnt += 1
    if cnt == k
      prev.next = prev.next.next
      break
    end
    prev = temp
    temp = temp.next
  end
  return head
end

def removeEl(head, ele)
  return head if head == nil
  if head.value == ele
    head = head.next 
    return head
  end
  temp = head
  prev = nil
  while temp != nil do 
    if temp.value == ele
      prev.next = prev.next.next
      break
    end
    prev = temp
    temp = temp.next
  end
  return head
end


#Insertion
def addHead(head, val)
  return Node.new(val, nil) if head == nil
  temp = Node.new(val, head)
  return temp
end

def addTail(head, val)
  return Node.new(val, nil) if head == nil
  new_node = Node.new(val, nil)
  temp = head
  while temp.next != nil do 
    temp = temp.next
  end
  temp.next = new_node
  return head
end

def addPosition(head, val, k)
  if head == nil
    if k == 1
      return Node.new(val, nil)
    else
      return head
    end
  end
  return Node.new(val, head) if k == 1
  cnt = 0
  temp = head
  while temp != nil do
    cnt += 1
    if cnt == k - 1
      new_node = Node.new(val, temp.next)
      temp.next = new_node
      break
    end
    temp = temp.next
  end
  return head
end

def addValue(head, val, k)
  return nil if head == nil
  return Node.new(val, head) if head.value == k
  temp = head
  while temp.next != nil do
    if temp.next.value == k
      new_node = Node.new(val, temp.next)
      temp.next = new_node
      break
    end
    temp = temp.next
  end
  return head
end


# Example usage
head = nil
head = add_node_at_begining(head, 4)
head = add_node_at_begining(head, 5)
head = add_node_at_begining(head, 1)
head = add_node_at_begining(head, 23)
head = add_node_at_begining(head, 8)
head = add_node_at_begining(head, 6)
head = add_node_at_begining(head, 9)

print_list(head)
# head = removeHead(head)
# head = removeTail(head)
# head = removeK(head, 7)
# print_list(head)
# head = removeK(head, 1)
# print_list(head)
# head = removeK(head, 3)
# print_list(head)

# head = removeEl(head, 23)
# print_list(head)
# head = removeEl(head, 8)
# print_list(head)
# head = removeEl(head, 5)
# print_list(head)

head = addValue(head, 11 ,23)

print_list(head)