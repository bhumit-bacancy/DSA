# https://takeuforward.org/data-structure/print-all-permutations-of-a-string-array/
require "byebug"
# Recursion
# def solution(arr, length, ans, nums, subset)
#   if (subset.length == length)
#     ans << subset.dup
#     return
#   end

#   length.times do |i|
#     next if nums[i] == 1
#     nums[i] = 1
#     subset << arr[i]
#     solution(arr, length, ans, nums, subset)
#     subset.pop()
#     nums[i] = 0
#   end
# end

# def printAllPermutation(arr, length)
#   ans = []
#   nums = {}
#   subset = []
#   length.times do |ind|
#     nums[ind] = 0
#   end
#   solution(arr, length, ans, nums, subset)
#   return ans
# end

# Backtracing
def solution(ind, arr, length, ans, arr_length)
  if (ind == arr_length)
    ans << arr.dup
    return
  end

  length.times do |i|
    arr[ind], arr[ind + i] = arr[ind + i], arr[ind]
    solution(ind + 1, arr, length - 1, ans, arr_length)
    arr[ind], arr[ind + i] = arr[ind + i], arr[ind]
  end
end

def printAllPermutation(arr, length)
  ans = []
  solution(0, arr, length, ans, length)
  return ans.sort
end

puts "Answer is : #{printAllPermutation([1,2,3,4,5,6], 6)}"
# puts "Answer is : #{printAllPermutation([1,2,3], 3)}"
# puts "Answer is : #{printAllPermutation([1,2], 2)}"