# frozen_string_literal: true

# @param {Integer} n, a positive integer
# @return {Integer}
def reverse_bits(n)
  bits = n.to_s(2)
  bits = ('0' * (32 - bits.length)) + bits
  bits.reverse.to_i(2)
end

def reverse_bits(n)
  n.to_s(2).rjust(32, '0').reverse.to_i(2)
end

# Can do 31.downto(0)
def reverse_bits(n)
  reversed_bits = 0
  bit = 31
  while n.positive?
    insert = (n & 1) << bit
    reversed_bits |= insert
    bit -= 1
    n = n >> 1
  end
  reversed_bits
end

# Can do 31.downto(0) for cleaner code
def reverse_bits(n)
  reversed_bits = 0
  31.downto(0) do |nbr|
    insert = ((n >> (31 - nbr)) & 1) << nbr
    reversed_bits |= insert
  end
  reversed_bits
end
