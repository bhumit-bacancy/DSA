# https://takeuforward.org/data-structure/find-k-th-permutation-sequence/

require "byebug"
def solution(n, k, ans, arr)
  if (arr.empty?)
    return ans
  end
  
  fact_n = fact(n-1)
  ind = (k - 1) / fact_n
  ans << arr[ind]
  arr.delete(arr[ind])
  solution(n-1, k % fact_n, ans, arr)
end

def kThPermutaionSeq(n, k)
  ans = []
  solution(n, k, ans, (1..n).to_a)
  return ans
end

def fact(n)
  if n<= 1
    1
  else
    n * fact( n - 1 )
  end
end

puts "Answer is : #{kThPermutaionSeq(3, 3)}"
puts "Answer is : #{kThPermutaionSeq(3, 5)}"
puts "Answer is : #{kThPermutaionSeq(4, 17)}"

