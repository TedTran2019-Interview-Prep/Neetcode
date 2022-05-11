# @param {Integer[]} nums
# @return {Integer}
def single_number(nums)
  nums.inject { |accu, num| accu ^ num }
end

# Solved in two minutes