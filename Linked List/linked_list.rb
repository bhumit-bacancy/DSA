# Define a Node structure
require "byebug"
Node = Struct.new(:value, :next)

# Create a function to add a new node to the end of the list
def add_node(head, value)
  if head.nil?
    return Node.new(value, nil)
  else
    current = head
    while current.next
      current = current.next
    end
    current.next = Node.new(value, nil)
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

# Example usage
head = nil
head = add_node(head, 1)
head = add_node(head, 2)
head = add_node(head, 3)

print_list(head)

