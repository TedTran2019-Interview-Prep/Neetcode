# @param {Integer[]} nums
# @return {Integer[]}
# answer[i] = rest of elements multiplied together, except self
def simple_product(nums)
  total = nums.inject { |accu, num| accu * num }
  nums.map { |num| total / num }
end

# Prefix, Suffix
def product_except_self(nums)
  prefix = []
  total_product = 1
  nums.each do |num|
    prefix << total_product
    total_product *= num
  end

  suffix = []
  total_product = 1
  (nums.length - 1).downto(0) do |idx|
    suffix << total_product
    total_product *= nums[idx]
  end

  nums.map.with_index { |_n, i| prefix[i] * suffix[nums.length - 1 - i] }
end

# O(1) space (Output array doesn't count as extra space)
def product_except_self(nums)
  output = []
  total_product = 1
  nums.each do |num|
    output << total_product
    total_product *= num
  end

  total_product = 1
  (nums.length - 1).downto(0) do |idx|
    output[idx] = total_product * output[idx]
    total_product *= nums[idx]
  end
  output
end

# [1, 2, 3 ,4] -> Total product b4 and after num
# prefix: [1, 1, 2, 6]
# suffix: [1, 4, 12, 24]
# 1 * 24
# 1 * 12
# 2 * 4
# 1 * 6
# [24, 12, 8, 6]
#########################
# O(1) space?
# Run through to create prefix
# Run through w/ suffix counter, multiplying with prefix