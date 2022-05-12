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