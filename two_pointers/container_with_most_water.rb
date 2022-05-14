# @param {Integer[]} height
# @return {Integer}
# Brute force fails due to time limit exceeded
def max_area(height)
  max_water = 0
  (0...height.length - 1).each do |y|
    (y + 1...height.length).each do |x|
      challenger = (height[y] > height[x] ? height[x] : height[y]) * (x - y)
      max_water = challenger if challenger > max_water
    end
  end
  max_water
end

# Have shorter line look for taller line, sacrificing width
def max_area(height)
  idx_start = 0
  idx_end = height.length - 1
  max_water = 0
  while idx_start < idx_end
    challenger = (height[idx_start] > height[idx_end] ? height[idx_end] : height[idx_start]) 
    challenger *= (idx_end - idx_start)
    max_water = challenger if challenger > max_water

    if height[idx_start] > height[idx_end]
      idx_end -= 1
    else
        idx_start += 1
    end
  end
  max_water
end

height = [1,8,6,2,5,4,8,3,7]
puts max_area(height)