# frozen_string_literal: true

# @param {Integer} n, a positive integer
# @return {Integer}
# Binary string of length 32
def hamming_weight(n)
  n.to_s(2).count('1')
end

# Utilizing modulo
# Last number decides if it's odd or not
# Bit is activated == odd == 1, bit is not activated == even == 0
def hamming_weight(n)
  total_ones = 0
  until n.zero?
    total_ones += (n % 2)
    n = n >> 1
  end
  total_ones
end

# Utilizing &
def hamming_weight(n)
  total_ones = 0
  until n.zero?
    n &= (n - 1)
    total_ones += 1
  end
  total_ones
end
