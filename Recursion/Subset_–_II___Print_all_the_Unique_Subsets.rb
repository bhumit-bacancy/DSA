# https://takeuforward.org/data-structure/subset-ii-print-all-the-unique-subsets/


require "byebug"
def solution(ind, arr, length, ans, subset)
  if (ind == length)
    ans << subset.dup unless ans.include?(subset)
    return
  end
  subset << arr[ind]
  puts "subset is : #{arr[ind]} #{subset}"
  solution(ind + 1, arr, length, ans, subset)
  subset.pop()
  puts "subset is : #{arr[ind]} #{subset}"
  solution(ind + 1, arr, length, ans, subset)
end

def uniqSUbSetSum(arr, length)
  ans = []
  solution(0, arr, length, ans, [])
  return ans
end

puts "Answer is : #{uniqSUbSetSum([1,2,2], 3)}"