# https://takeuforward.org/data-structure/combination-sum-ii-find-all-unique-combinations/

require "byebug"
def solution(ind, arr, length, ans, target, subset)
  if (ind == length)
    if target == 0
      ans << subset.dup.sort unless ans.include?(subset.dup.sort)
    end
    return
  end
  
  subset << arr[ind]
  solution(ind + 1, arr, length, ans, target - arr[ind], subset)
  subset.pop()
  solution(ind + 1, arr, length, ans, target, subset)
end

def subSetSum(arr, length, target)
  ans = []
  subset = []
  solution(0, arr, length, ans, target, subset)
  return ans
end

puts "Answer is : #{subSetSum([10,1,2,7,6,1,5], 7, 8)}"
puts "Answer is : #{subSetSum([2,3,6,7,1], 5, 6)}"
puts "Answer is : #{subSetSum([2], 1, 1)}"