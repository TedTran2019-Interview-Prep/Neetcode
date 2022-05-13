# @param {Integer[]} nums
# @return {Integer}
# -1 == haven't read
# -2 == earlier point has read
# This solution is 272 ms compared to the 2nd solution's 1240 ms
def longest_consecutive(nums)
  return 0 if nums.empty?

  hash = {}
  nums.each { |num| hash[num] = -1 }
  nums.each do |num|
    next unless hash[num] == -1
    
    longest_consec = 1
    while true
      val = hash[num + longest_consec]
      case val
      when -1
        hash[num + longest_consec] = -2
        longest_consec += 1
      when nil
        hash[num] = longest_consec
        break
      else
        longest_consec += hash[num + longest_consec]
        hash[num] = longest_consec
        break
      end
    end
  end

  hash.max_by { |k, v| v}[1]
end

nums = [100,4,200,1,3,2]
puts longest_consecutive(nums)
nums = [0,3,7,2,5,8,4,6,0,1]
puts longest_consecutive(nums)

# Neetcode's solution is a lot better
# E.g, check for left neighbor to see if it's the start of a sequence
# If it's the start of a sequence, then calculate length
# Then choose longest length
def longest_consecutive(nums)
  return 0 if nums.empty?

  hash = {}
  nums.each { |num| hash[num] = true }
  longest = 0
  nums.each do |num|
    next if hash[num - 1] 

    challenger = 1
    while true
      if hash[num + challenger]
        challenger += 1
      else
        break
      end
    end
    longest = challenger if challenger > longest
  end

  longest
end
