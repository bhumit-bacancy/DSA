# same as split_array_largest_sum

require "byebug"
def solution(arr, low, high, n, m)
  while (low <= high) do
    mid = (low + high)/2
    is_allocation_possible = allocation_possible(arr, mid, m)
    if is_allocation_possible[1]
      high = mid - 1
      ans = mid
    else
      low = mid + 1
    end
  end
  low
end

def allocation_possible(arr, mid, m)
  count = 0
  allocation_possible = false
  start = 0
  arr.each do |elem|
    if (elem + start) > mid
      count += 1
      start = elem
    else
      start += elem
    end 
  end  
  [count == m, count < m, count]                  
end

def split_array_largest_sum(arr, n, m)
  return -1 if n < m
  low = arr.max
  high = arr.sum
  solution(arr, low, high, n, m)
end

p "answer: #{split_array_largest_sum([1,2,3,4,5], 5, 3)}"
p "answer: #{split_array_largest_sum([3,5,1], 3, 3)}"
p "answer: #{split_array_largest_sum([10, 20, 30, 40], 4, 2)}"
