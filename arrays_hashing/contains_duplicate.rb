# frozen_string_literal: true

# @param {Integer[]} nums
# @return {Boolean}
# Can also be done by converting to a set and comparing lengths
def contains_duplicate(nums)
  hash = {}
  nums.each do |num|
    return true if hash.key? num

    hash[num] = true
  end
  false
end
