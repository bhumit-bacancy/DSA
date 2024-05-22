#https://takeuforward.org/data-structure/n-queen-problem-return-all-distinct-solutions-to-the-n-queens-puzzle/

#Backtracing
require "byebug"
def solution(ind, prevSlot, availbleSlot, arr, length, ans, arr_length, subset)
  if (ind == arr_length)
    ans << queen_format(subset.dup)
    return
  end

  arr.each do |elem|
    next if elem.nil?
    next unless canBePlaced(elem, prevSlot, availbleSlot)
    availbleSlot[elem] = false
    arr[elem] = nil
    subset[ind] = elem 
    solution(ind + 1, elem, availbleSlot, arr, length - 1, ans, arr_length, subset)
    availbleSlot[elem] = true
    subset[ind] = nil
    arr[elem] = elem
  end
end

def canBePlaced(i, prevSlot, availbleSlot)
  return true if (availbleSlot[i] && (i-prevSlot.to_i).abs > 1) || prevSlot.nil?
  false
end

def queenProblem(length)
  ans = []
  arr = (0..length - 1).to_a
  availbleSlot = {}
  length.times do |i|
    availbleSlot[i] = true
  end
  solution(0, nil, availbleSlot, arr, length, ans, length, [])
  return ans
end

def queen_format(arr)
  ans = []
  temp_arr = ["."]*arr.length
  arr.each do |e|
    temp_arr[e] = "Q"
    ans << temp_arr.dup
    temp_arr[e] = "."
  end
  ans
end

puts "Answer is : #{queenProblem(4)}"
# puts "Answer is : #{queenProblem(4)}"


#Recursion