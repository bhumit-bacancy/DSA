# https://takeuforward.org/data-structure/allocate-minimum-number-of-pages/

require "byebug"
def solution(pages, low, high, n, m)
  while (low <= high) do
    mid = (low + high)/2
    is_allocation_possible = allocation_possible(pages, mid, m)
    if is_allocation_possible[1]
      high = mid - 1
      ans = mid
    else
      low = mid + 1
    end
  end
  low
end

def allocation_possible(pages, mid, m)
  count = 0
  allocation_possible = false
  start = 0
  pages.each do |elem|
    if (elem + start) > mid
      count += 1
      start = elem
    else
      start += elem
    end 
  end  
  [count == m, count < m, count]                  
end

def minimum_number_of_pages(pages, n, m)
  return -1 if n < m
  low = pages.max
  high = pages.sum
  solution(pages, low, high, n, m)
end

p "answer: #{minimum_number_of_pages([12, 34, 67, 90], 4, 2)}"
p "answer: #{minimum_number_of_pages([25, 46, 28, 49, 24], 5, 4)}"