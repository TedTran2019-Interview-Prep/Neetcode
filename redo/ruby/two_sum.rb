# frozen_string_literal: true

# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}
def two_sum(nums, target)
  nums.each_with_object({}).with_index do |(num, hash), index|
    return [hash[num], index] if hash.key? num

    hash[target - num] = index
  end
end
