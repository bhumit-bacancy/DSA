# https://takeuforward.org/data-structure/rat-in-a-maze/


require "byebug"
def solution(elem, arr, x, y, ans, subset, temp, length)
  return if (elem == 0 || elem.nil?)
  if (x == length - 1) && (y == length - 1)
    ans << temp.dup.join()
    return
  end
  
  arr[x][y] = 0
  temp << "U"
  solution(arr[x-1][y], arr, x-1, y, ans, subset, temp, length) if x-1 >= 0 && y >= 0 && x-1 < length && y < length && arr[x-1][y] == 1 #upward
  # arr[x][y] = 1
  # arr[x][y] = 0
  temp.pop()
  temp << "D"
  solution(arr[x+1][y], arr, x+1, y, ans, subset, temp, length) if x+1 >= 0 && y >= 0 && x+1 < length && y < length && arr[x+1][y] == 1 #downward
  # arr[x][y] = 1
  # arr[x][y] = 0
  temp.pop()
  temp << "L"
  solution(arr[x][y-1], arr, x, y-1, ans, subset, temp, length) if x >= 0 && y-1 >= 0 && x < length && y-1 < length && arr[x][y-1] == 1 #left
  # arr[x][y] = 1
  # arr[x][y] = 0
  temp.pop()
  temp << "R"
  solution(arr[x][y+1], arr, x, y+1, ans, subset, temp, length) if x >= 0 && y+1 >= 0 && x < length && y+1 < length && arr[x][y+1] == 1 #right
  temp.pop()
  arr[x][y] = 1
end

def rateInMaze(length, arr)
  ans = []
  subset = []
  temp = []
  if arr[length-1][length-1] == 0
    return "Blocked"
  else
    solution(arr[0][0], arr, 0, 0, ans, subset, temp, length)
    return ans  
  end
end


puts "Answer is : #{rateInMaze(2, [[1,0],[1,0]])}"
puts "Answer is : #{rateInMaze(4, [[1,0,0,0],[1,1,0,1],[1,1,0,0],[0,1,1,1]])}"
