#https://takeuforward.org/binary-search/koko-eating-bananas/

#https://takeuforward.org/data-structure/nth-root-of-a-number-using-binary-search/

require "byebug"
def midN(low, number, high)
  (low + high)/2
end

def multiplyM(mid, number, m)
  ans = 1
  number.times do 
    ans = ans * mid
    if ans > m
      break
    end
  end
  if ans == m
    return 0
  elsif ans < m
    return 1
  else
    return 2
  end
end

def nthRoot(number, m)
  low = 1
  high = m
  while (low <= high) do
    mid = midN(low, number, high)
    value = multiplyM(mid, number, m)
    case value
    when 0
      return mid
      break
    when 1
      low = mid + 1
    when 2
      high = mid - 1
    end
  end
  return -1
end

puts "Answer is : #{nthRoot(3, 27)}"
puts "Answer is : #{nthRoot(4, 64)}"