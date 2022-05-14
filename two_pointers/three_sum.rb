# @param {Integer[]} nums
# @return {Integer[][]}
# This solution times out 
def three_sum(nums)
  hash = {}
  two_sum = Hash.new { |h, k| h[k] = [] }
  solutions = {}
  nums.each_with_index do |num, idx|
    if two_sum.key?(0 - num)
      two_sum[0 - num].each do |arr|
        solution = [*arr, num].sort
        solutions[solution] = true unless solutions.key?(solution)
      end
    end
    hash.each do |k, v|
      two_sum[k + num] << [v, num]
    end
    hash[num] = num
  end
  solutions.keys
end

# Neetcode solution
# Very similar to two_sum 2
# To deal with duplicates, skip if it's a duplicate
# Do this in the outer AND inner loops
def three_sum(nums)
  sums = []
  nums.sort! # This is to get rid of duplicate solutions
  nums.each_with_index do |num, idx|
    next if idx > 0 && num == nums[idx - 1]

    left = idx + 1
    right = nums.length - 1
    while left < right
      case num + nums[left] + nums[right] <=> 0
      when 1 
        right -= 1
      when 0
        sums << [num, nums[left], nums[right]]
        left += 1
        while nums[left] == nums[left - 1] && left < right
          left += 1
        end
      when -1
        left += 1
      end
    end
  end
  sums
end

nums = [-1,0,1,2,-1,-4]
print three_sum(nums)
nums = [-1,0,1,0]
print three_sum(nums)
nums = [-1,0,1,2,-1,-4,-2,-3,3,0,4]
print three_sum(nums)

