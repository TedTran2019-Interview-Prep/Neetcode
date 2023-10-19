# Brute force method O(N^2)
# Compare every number with every other number
def contains_duplicate(nums)
  (0...nums.length - 1).each do |y|
    (y + 1...nums.length).each do |x|
      return true if nums[y] == nums[x]
    end
  end
  false
end

# Optimal solution utilizing sets
def contains_duplicate(nums)
  nums.each_with_object(Set.new) do |num, set|
    set.include?(num) ? (return true) : set.add(num)
  end
  false
end

# Optimal solution utilizing hashmap
def contains_duplicate(nums)
  nums.each_with_object({}) do |num, dict|
    dict.key?(num) ? (return true) : (dict[num] = true)
  end
  false
end
