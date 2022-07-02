# frozen_string_literal: true

# @param {Integer} n
# @return {Integer[]}
def count_bits(n)
  bits = []
  (n + 1).times { |nbr| bits << count_bit(nbr) }
  bits
end

# Count one bits in nbr
def count_bit(nbr)
  one_bits = 0
  until nbr.zero?
    one_bits += (nbr % 2)
    nbr = nbr >> 1
  end
  one_bits
end

################################################################

# Solving using dynamic programming
# Offset = most significant bit you've reached so far
# 1 + dp[offset idx]
# 0 -> 0000 -> 0 (0)
# 1 -> 0001 -> 1 (1)
# 2 -> 0010 -> 1 (2)
# 3 -> 0011 -> 2 (2 + 1)
# 4 -> 0100 -> 1 (4)
# 5 -> 0101 -> 2 (4 + 1)
# 6 -> 0110 -> 2 (4 + 2)
# 7 -> 0111 -> 3 (4 + 3)
# 8 -> 1000 -> 1 (8)
# [0, 1, 1, 2, 1, 2, 2, 3, 1]
# If nbr == most significant bit, calculate
# Else, calculate by most significant bit, (nbr - most significant bit)
# How to get most significant bit? Screw it-- cheap way, calculate it
# 0, 1, 2, 4, 8, 16... are the most significant bits

def count_bits(n)
  bits = []
  offset = 2
  (n + 1).times do |nbr|
    bits << if nbr <= 2 || nbr == (offset * 2)
              # count_bit(nbr)
              nbr.zero? ? 0 : 1
            else
              (bits[offset] + bits[nbr - offset])
            end

    offset *= 2 if nbr == offset * 2
  end
  bits
end

def count_bit(nbr)
  one_bits = 0
  until nbr.zero?
    one_bits += (nbr % 2)
    nbr = nbr >> 1
  end
  one_bits
end
