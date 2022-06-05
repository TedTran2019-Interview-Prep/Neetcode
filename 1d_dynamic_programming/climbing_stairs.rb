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

# Think Fibonacci.
# 1, 2, 3, 5, 8, 13
