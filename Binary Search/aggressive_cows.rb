# https://takeuforward.org/data-structure/aggressive-cows-detailed-solution/

require "byebug"
def solution(stalls, low, high, n, k)
  while (low <= high) do
    mid = (low + high)/2
    is_assigning_possible = assigning_possible(stalls, mid, k)
    if is_assigning_possible
      low = mid + 1
    else
      high = mid - 1
    end
  end
  high
end

def assigning_possible(stalls, mid, k)
  count = 0
  assigning_possible = false
  start = stalls[0]
  stalls.each do |elem|
    if (elem - start) >= mid
      count += 1
      if count >= k - 1
        assigning_possible = true
        break
      end
      start = elem
    end 
  end  
  assigning_possible                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
end

def aggessive_cows(stalls, n, k)
  stalls = stalls.sort
  return -1 if n < k
  diff = stalls.last - stalls.first
  return diff if k == 2
  low = 1
  high = diff
  solution(stalls, low, high, n, k)
end

p "answer: #{aggessive_cows([0,3,4,7,10,9], 6, 4)}"
p "answer: #{aggessive_cows([4,2,1,3,6], 5, 2)}"