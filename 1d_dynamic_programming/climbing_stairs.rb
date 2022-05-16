# @param {Integer} n
# @return {Integer}
# Intuition: Decision tree, 1 or 2 steps then branch.
# Brute Force
def climb_stairs(n)
  return 1 if n.zero?
  return 0 if n.negative?

  climb_stairs(n - 1) + climb_stairs(n - 2)
end

# Memoize
$repeat = []
def climb_stairs(n)
  return 1 if n.zero?
  return 0 if n.negative?

  if $repeat[n].nil?
    res = climb_stairs(n - 1) + climb_stairs(n - 2)
    $repeat[n] = res
  else
    res = $repeat[n]
  end
  res
end

# Real DP solution
# Bottom up approach
def climb_stairs(n)
  return 0 if n.zero?
  return 1 if n == 1

  dp = []
  dp[n] = 1
  dp[n - 1] = 1
  (n - 2).downto(0) do |idx|
    dp[idx] = dp[idx + 1] + dp[idx + 2]
  end
  dp.first
end

# Without array
def climb_stairs(n)
  return 0 if n.zero?
  return 1 if n == 1

  two = 1
  one = 1
  (n - 2).downto(1) do
    tmp = one
    one += two
    two = tmp
  end
  one + two
end

# Disregard all of this
# n steps to reach the top
# 2
# 1 step + 1 step
# 2 steps
# 3
# 1 step + 1 step + 1 step
# 1 step + 2 steps
# 2 steps + 1 step
# 4
# 4 1 steps
# 2 2 steps
# 1 step 1 step 2 step 
# 1 step 2step 1 step
# 2step 1 step 1 step
# ---------------------->
# Recursively decrease problem?
# 1 way to reach 1 step
# 2 ways to reach 2 steps
# 3 ways to reach 3 steps
# How many ways to reach 4 steps?
# 5 ways to reach 4 steps
# How many ways to reach 5 steps?
# 5 1 step ->  1 1 1 1 1
# 2 2 step 1 step -> 2 2 1
# 1 2 step 3 1 step -> 2 1 1 1
#  Then variants of the two. 
# 2 1 2
# 1 2 2
# 1 2 1 1
# 1 1 2 1
# 1 1 1 2
# 8 ways to reach 5 steps

# Odd -> 1
# 1

# Even -> 2
# 1 1
# 2

# Odd -> 3
# 1 1 1
# 2 1

# Even -> 5
# 1 1 1 1
# 2 1 1
# 2 2

# Odd -> 8
# 1 1 1 1 1
# 2 1 1 1
# 2 2 1

# Even to Odd
# 'Height' increases by 0
# Length aka probabilities per non-first increases by idx

# Odd to Even
# 'Height' increases by 1 (+1)
# Length aka probabilities per non-first increases by idx, aka 1, 2...
# Newly added doesn't count into calculations, just a flat +1

# Calculate 'height' per number
# n / 2 + 1
# Each height is a single unique possibility
# How to calculate prior values to get increases?
# n - 2 again and again until it's negative
# 5 - 2 = 3 -> number of 1s
# all permutations of 2 1 1 1 -> (4)
# 5 - 4 = 1 -> number of 1s
# all permutations of 2 2 1 -> (3)
# Okay all this is pointless, let's just code
