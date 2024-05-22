module DLL
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
end