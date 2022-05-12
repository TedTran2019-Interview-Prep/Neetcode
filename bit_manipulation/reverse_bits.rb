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

def reverse_bits(n)
  reversed_bits = 0
  bit = 31
  while n > 0 
    insert = (n & 1) << bit
    reversed_bits = reversed_bits | insert
    bit -= 1
    n = n >> 1
  end
  reversed_bits
end