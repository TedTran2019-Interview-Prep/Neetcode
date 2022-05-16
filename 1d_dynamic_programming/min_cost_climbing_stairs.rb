# @param {Integer[]} cost
# @return {Integer}
# Brute Force
def min_cost_climbing_stairs(cost)
  return 0 if cost.empty?

  cost1 = min_cost(cost)
  cost2 = min_cost(cost[1..-1])
  if cost.length == 1
    cost1
  else
    cost1 > cost2 ? cost2 : cost1
  end
end

def min_cost(cost)
  return 0 if cost.empty?

  single = cost.first + min_cost(cost[1..-1])
  if cost.length > 1
    double = cost.first + min_cost(cost[2..-1])
  end
  if cost.length > 1
    single > double ? double : single
  else
    single
  end
end
#######################################################
# Memoize
$memo = []
def min_cost_climbing_stairs(cost)
  return 0 if cost.empty?
  idx = 0

  cost1 = min_cost(cost, idx)
  cost2 = min_cost(cost, idx + 1)
  if cost.length == 1
    cost1
  else
    cost1 > cost2 ? cost2 : cost1
  end
end

def min_cost(cost, idx)
  return 0 if idx >= cost.length

  if $memo[idx].nil?
    single = cost[idx] + min_cost(cost, idx + 1)
    if cost.length - idx > 1
      double = cost[idx] + min_cost(cost, idx + 2)
    end
    if cost.length - idx > 1
      res = single > double ? double : single
    else
      res = single
    end
    $memo[idx] = res
  else
    $memo[idx]
  end
end
#######################################################
# Global variable broke Leetcode, so here's with passing in as arg
def min_cost_climbing_stairs(cost)
  return 0 if cost.empty?
  idx = 0
  memo = []

  cost1 = min_cost(cost, idx, memo)
  cost2 = min_cost(cost, idx + 1, memo)
  if cost.length == 1
    cost1
  else
    cost1 > cost2 ? cost2 : cost1
  end
end

def min_cost(cost, idx, memo)
  return 0 if idx >= cost.length

  if memo[idx].nil?
    single = cost[idx] + min_cost(cost, idx + 1, memo)
    if cost.length - idx > 1
      double = cost[idx] + min_cost(cost, idx + 2, memo)
    end
    if cost.length - idx > 1
      res = single > double ? double : single
    else
      res = single
    end
    memo[idx] = res
  else
    memo[idx]
  end
end

#######################################################
# Bottom-up DP
def min_cost_climbing_stairs(cost)
  return 0 if cost.empty?
  return cost.first if cost.length == 1

  second = 0
  first = cost[-1]
  (cost.length - 2).downto(0) do |idx|
    cost1 = cost[idx] + first 
    cost2 = cost[idx] + second
    tmp = cost1 > cost2 ? cost2 : cost1
    second = first
    first = tmp
  end
  first > second ? second : first
end

puts min_cost_climbing_stairs([1,100,1,1,1,100,1,1,100,1])