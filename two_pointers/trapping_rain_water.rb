# frozen_string_literal: true

# @param {Integer[]} height
# @return {Integer}
# min(L, R) - h[i]
# 0 is the minimum, obviously
# maxLeft
# maxRight
def trap(height)
  max_left = []
  max_right = []

  max = 0
  height.each do |line|
    max_left << max
    max = line if line > max
  end

  max = 0
  (height.length - 1).downto(0).each do |idx|
    max_right.unshift(max)
    max = height[idx] if height[idx] > max
  end

  total_water = 0
  height.each_with_index do |line, idx|
    min = max_left[idx] > max_right[idx] ? max_right[idx] : max_left[idx]
    water = min - line
    next if water < 1

    total_water += water
  end
  total_water
end

# 0(1) space
def trap(height)
  max_water = 0
  max_left = height.first
  max_right = height.last
  left = 0
  right = height.length - 1

  while left < right
    if max_left > max_right
      right -= 1
      water = max_right - height[right]
      max_right = height[right] if height[right] > max_right
    else
      left += 1
      water = max_left - height[left]
      max_left = height[left] if height[left] > max_left
    end
    max_water += water unless water < 1
  end
  max_water
end

height = [0, 1, 0, 2, 1, 0, 1, 3, 2, 1, 2, 1]
height2 = [4, 2, 0, 3, 2, 5]
height3 = [4, 2, 3]
height4 = [5, 4, 1, 2]

puts trap(height)
puts trap(height2)
puts trap(height3)
puts trap(height4)
