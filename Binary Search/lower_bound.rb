# https://takeuforward.org/arrays/implement-lower-bound-bs-2/


require "byebug"
def lowerBound(arr, n, x)
  low = 0
  high = n - 1
  ans = n
  while (low < high) do
    mid = (low+high)/2
    if arr[mid] >= x
      high = mid - 1
      ans = mid
    else
      low = mid + 1
    end
  end
  return ans
end

puts "Answer is : #{lowerBound([1,2,2,3], 4, 2)}"
puts "Answer is : #{lowerBound([3,5,8,15,19], 5, 9)}"