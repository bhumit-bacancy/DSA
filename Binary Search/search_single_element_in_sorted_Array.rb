#https://takeuforward.org/data-structure/search-single-element-in-a-sorted-array/

require "pry-byebug"
def midN(low, high)
  (low + high)/2
end

def searchSingleElement(arr, n)
  if n == 1
    return arr[0]
  end
  low = 0
  high = n - 1
  while (low <= high) do
    mid = midN(low, high)
    binding.pry
    if mid == 0
      if arr[mid] != arr[mid + 1]
        return arr[0]
        break
      else
        return "not possible"
        break
      end
    end
    if mid == n-1
      if arr[mid] != arr[mid-1]
        return arr[n-1]
        break
      else
        return "not possible"
        break
      end
    end
    if (arr[mid] != arr[mid + 1] && arr[mid] != arr[mid - 1])
      return arr[mid]
      break
    end
    if mid.even?
      if (arr[mid] == arr[mid + 1] && arr[mid] != arr[mid - 1])
        low = mid + 1
      else
        high = mid - 1
      end
    end

    if mid.odd? 
      if (arr[mid] != arr[mid + 1] && arr[mid] == arr[mid - 1])
        low = mid + 1
      else
        high = mid - 1
      end
    end 
  end
end

puts "Answer is : #{searchSingleElement([1,1,2,2,3,3,4,5,5,6,6], 11)}"
puts "Answer is : #{searchSingleElement([1,1,3,5,5], 5)}"