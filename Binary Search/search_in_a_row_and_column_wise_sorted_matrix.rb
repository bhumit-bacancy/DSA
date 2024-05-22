# https://takeuforward.org/arrays/search-in-a-row-and-column-wise-sorted-matrix/

require "byebug"
def solution(arr, low, high, n, m)
  while (low <= high) do
    mid = (low + high)/2
    is_allocation_possible = allocation_possible(arr, mid, m)
    if is_allocation_possible[1]
      high = mid - 1
      ans = mid
    else
      low = mid + 1
    end
  end
  low
end

def search_element(arr, n, m, target)
  
end

p "answer: #{search_element([[1,4,7,11,15],[2,5,8,12,19],[3,6,9,16,22],[10,13,14,17,24],[18,21,23,26,30]], 5, 5, 14)}"
p "answer: #{search_element([[1,3,7], [6,13,15],[14,20,21]], 3, 3, 12)}"
