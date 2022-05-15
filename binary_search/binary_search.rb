# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer}
def search(nums, target)
  return -1 if nums.empty?

  half = nums.length / 2
  case nums[half] <=> target
  when 1
    return search(nums[0...half], target)
  when -1
    idx = search(nums[half + 1..-1], target)
    return (idx == -1 ? -1 : half + 1 + idx)
  when 0
    return half
  end
end