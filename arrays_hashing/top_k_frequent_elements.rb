# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer[]}
def top_k_frequent(nums, k)
  hash = Hash.new(0)
  nums.each { |num| hash[num] += 1 }
  hash.to_a.sort { |a, b| b[1] <=> a[1] }.take(k).map { |k_v| k_v[0] }
end

# Bucket sort solution (Clever as hell, thanks Neetcode)
# Maximum number of occurrences == nums.length
def top_k_frequent(nums, k)
  hash = Hash.new(0)
  counts = Array.new(nums.length + 1) { [] }
  nums.each { |num| hash[num] += 1 }
  hash.each { |k, v| counts[v] << k }
  top_k = []
  nums.length.downto(1) do |n|
    return top_k if k <= 0
    next if counts[n].empty?

    top_k.concat(counts[n].take(k))
    k -= counts[n].length
  end
  top_k
end
