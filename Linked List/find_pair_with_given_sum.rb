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

def findPairWithSum(head, sum)
  return nil if head == nil || head.next == nil
  temp1 = head
  temp2 = head
  ans = []
  while temp2.next != nil do
    temp2 = temp2.next
  end
  while temp1.value < temp2.value do
    val1 = temp1.value
    val2 = temp2.value
    sum1 = val1 + val2
    if sum1 == sum
      temp1 = temp1.next
      temp2 = temp2.back
      ans << [val1, val2]
    elsif sum1 > sum
      temp2 = temp2.back
    else
      temp1 = temp1.next
    end
  end
  ans
end

arr = [1,2,3,4,5,6,7,8]
head = convertToDLL(arr)
p findPairWithSum(head, 6)
print_list(head)