# frozen_string_literal: true

# @param {Integer[]} prices
# @return {Integer}
# Time limit exceeded, brute force
def max_profit(prices)
  max_profit = 0
  (0...prices.length - 1).each do |y|
    (y + 1...prices.length).each do |x|
      profit = prices[x] - prices[y]
      max_profit = profit if profit > max_profit
    end
  end
  max_profit
end

# Must buy b4 sell (obviously)
# Greatest difference in value
# Buy (low as possible)
# Sell (High as possible)

# Go through array once getting highest sells
# Compare each price w/ highest_sell
def max_profit(prices)
  max_sell = []
  max = 0
  (prices.length - 1).downto(0).each do |idx|
    max_sell.unshift(max)
    max = prices[idx] if prices[idx] > max
  end

  max_profit = 0
  (0...prices.length - 1).each do |idx|
    profit = max_sell[idx] - prices[idx]
    max_profit = profit if profit > max_profit
  end

  max_profit
end

print max_profit([7, 1, 5, 3, 6, 4])

# Compare lowest value found so far w/ every value that comes after
def max_profit(prices)
  max_profit = 0
  min = prices.first
  prices.each do |price|
    min = price if price < min
    profit = price - min
    max_profit = profit if profit > max_profit
  end
  max_profit
end

# Why is this in the sliding window section? Feels out of place
