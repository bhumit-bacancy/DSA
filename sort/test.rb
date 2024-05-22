require "byebug"
def search(nums, target)
  bSearch(nums, target, 0, nums.length - 1)
  
end

def bSearch(nums, target, low, high)
  mid = (low+high)/2
  return -1 if high < low
  if nums[mid] == target
    return mid
  elsif nums[low] < nums[mid] && target >= nums[low] && target < nums[mid]
    return bSearch(nums, target, low, mid-1)
  elsif nums[low] > nums[mid] && (target >= nums[low] || target < nums[mid])
    return bSearch(nums, target, low, mid-1)
  else
    return bSearch(nums, target, mid+1, high)
  end
end

p search([4,5,6,7,0,1,2], 0)
p search([4,5,6,7,0,1,2], 3)
p search([1], 0)
p search([5,1,3], 5)
p search([5,1,2,3,4], 1)



