# https://takeuforward.org/arrays/minimum-days-to-make-m-bouquets/

require "pry-byebug"

def solution(bloom_day, low, high, m, k)
  ans = high
  while (low <= high) do
    mid = (low + high)/2
    count = find_buquets_on_day(bloom_day, mid, m, k)
    if count >= m
      high = mid - 1
      ans = mid
    else
      low = mid + 1
    end
  end
  ans
end

def find_buquets_on_day(bloom_day, mid, m, k)
  count = 0
  adjancet_flowers = 0
  bloom_day.each do |elem|
    if elem <= mid
      adjancet_flowers += 1
    else
      count += (adjancet_flowers/k)
      adjancet_flowers = 0
      break if count > m
    end
  end
  count += (adjancet_flowers/k)
  count
end

def min_days(bloom_day, m, k)
  n = bloom_day.length
  return -1 if n < (m * k)
  low = bloom_day.min()
  high = bloom_day.max()
  solution(bloom_day, low, high, m, k)
end

puts min_days([1,10,3,10,2], 3, 1)