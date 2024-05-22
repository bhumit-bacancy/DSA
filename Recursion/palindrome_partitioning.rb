# https://takeuforward.org/data-structure/palindrome-partitioning/

require "byebug"
def solution(ind, str, ans, subset, temp, length)
  if ind == length
    ans << temp.dup
    return
  end
  
  if palindrome?(subset)
    subset << str[ind]
    puts "#{subset}==== #{str[ind]}=="
    solution(ind + 1, str, ans, subset, temp, length)
  else
    temp << subset.dup
    byebug
    subset = []
    solution(ind + 1, str, ans, subset, temp, length)
    temp.pop()
  end
end

def palindromePartitioning(str)
  ans = []
  subset = []
  temp = []
  solution(0, str, ans, subset, temp, str.length)
  return ans
end


def palindrome?(str)
  if str == str.reverse
    return true
  else
    return false
  end
end

def split_string

end

puts "Answer is : #{palindromePartitioning("aab")}"
puts "Answer is : #{palindromePartitioning("aabb")}"
