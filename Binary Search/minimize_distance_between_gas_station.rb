#Brute force approach

# def minimize_distance(arr, n, k)
#   howMany = Hash.new(0)
#   k.times do |gasStations|
#     maxSection = -1
#     maxInd = -1
#     n.times do |i|
#       break if i == n-1
#       diff = arr[i + 1] - arr[i]
#       sectionLength = diff.to_f / (howMany[i] + 1)
#       if sectionLength > maxSection 
#         maxSection = sectionLength
#         maxInd = i
#       end
#     end
#     howMany[maxInd] += 1
#   end
#   maxAns = -1
#   (n-1).times do |i|
#     diff = arr[i+1] - arr[i]
#     sectionLength = diff.to_f / (howMany[i] + 1)
#     maxAns = sectionLength if sectionLength > maxAns
#   end
#   maxAns
# end


#binary search

puts minimize_distance([1,2,3,4,5], 5, 4)
puts minimize_distance([1,2,3,4,5,6,7,8,9,10], 10, 1)