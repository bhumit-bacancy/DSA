#https://takeuforward.org/data-structure/quick-sort-algorithm/

require "byebug"
def solution(ind, arr, length, ans, sum)
  if (ind == length)
    ans << sum
    return
  end
  solution(ind + 1, arr, length, ans, sum + arr[ind])
  solution(ind + 1, arr, length, ans, sum)
end

def quickSort(arr, length)
  ans = []
  solution(0, arr, length, ans, 0)
  return ans
end

puts "Answer is : #{quickSort([3,1,2], 3)}"