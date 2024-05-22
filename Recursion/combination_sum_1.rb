# https://takeuforward.org/data-structure/combination-sum-1/

require "byebug"
def solution(ind, arr, length, ans, target, subset)
  if (ind == length)
    if target == 0
      ans << subset.dup
    end
    return
  end
  if (arr[ind] <= target)
    subset << arr[ind]
    solution(ind, arr, length, ans, target - arr[ind], subset)
    subset.pop()
  end

  solution(ind + 1, arr, length, ans, target, subset)
end

def subSetSum(arr, length, target)
  ans = []
  subset = []
  solution(0, arr, length, ans, target, subset)
  return ans
end

puts "Answer is : #{subSetSum([2,3,6,7,1], 5, 6)}"
puts "Answer is : #{subSetSum([2], 1, 1)}"