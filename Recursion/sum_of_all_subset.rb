#https://takeuforward.org/data-structure/subset-sum-sum-of-all-subsets/

require "byebug"
def solution(ind, arr, length, ans, sum)
  if (ind == length)
    ans << sum
    return
  end
  solution(ind + 1, arr, length, ans, sum + arr[ind])
  solution(ind + 1, arr, length, ans, sum)
end

def subSetSum(arr, length)
  ans = []
  solution(0, arr, length, ans, 0)
  return ans
end

puts "Answer is : #{subSetSum([3,1,2], 3)}"