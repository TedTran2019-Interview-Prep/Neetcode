# frozen_string_literal: true

# @param {Integer[]} nums
# @return {Integer}
def missing_number(nums)
  nbr1 = nums.inject { |accu, n| accu ^ n }
  nbr2 = (0..nums.length).inject { |accu, n| accu ^ n }
  nbr1 ^ nbr2
end

def missing_number(nums)
  missing = 0
  (0..nums.length).each do |i|
    nbr = (nums[i].nil? ? 0 : nums[i])
    missing += (i - nbr)
  end
  missing
end

# Gauss summation of numbers
def missing_number(nums)
  gauss = (nums.length / 2.0) * (nums.length + 1)
  nums.each { |n| gauss -= n }
  gauss.to_i
end
