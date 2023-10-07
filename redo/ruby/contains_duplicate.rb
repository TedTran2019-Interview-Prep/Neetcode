# @param {Integer[]} nums
# @return {Boolean}
def contains_duplicate(nums)
  dict = {}
  nums.each do |num|
    return true if dict.key? num

    dict[num] = true
  end
  false
end

# Utilizing a set
def contains_duplicate(nums)
  set = Set.new
  nums.each do |num|
    return true if set.include?(num)

    set.add(num)
  end
  false
end

# Utilizing a set and each_with_object
def contains_duplicate(nums)
  nums.each_with_object(Set.new) do |num, set|
    set.include?(num) ? (return true) : set.add(num)
  end
  false
end
