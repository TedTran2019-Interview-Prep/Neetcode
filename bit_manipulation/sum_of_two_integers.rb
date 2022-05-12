# @param {Integer} a
# @param {Integer} b
# @return {Integer}
def get_sum(a, b)
  mask = 0xffffffff # 32 bit maximum
  res = 0
  carry = 0
  32.times do |n|
    bit_a = (a >> n) & 1
    bit_b = (b >> n) & 1

    if (bit_a | bit_b).zero?
      if carry == 1
        carry -= 1
        res = res | (1 << n)
      end
    elsif (bit_a & bit_b) == 1
      if carry == 1
        res = res | (1 << n)
      else 
        carry += 1
      end
    elsif carry == 0
      res = res | (1 << n)
    end
  end
  res = res & mask
  if (res >> 31) & 1 == 1
    # XOR flips rightmost 32, then NOT flips all bits
    res = ~(res ^ mask)
  end
  res
end

# 1 = 0001
# 2 = 0010
# 3 = 0011
# 4 = 0100
# 5 = 0101
# 6 = 0110
# 7 = 0111
# 8 = 1000

# Works on positive numbers
puts get_sum(825, 1234)
# Negative?
puts get_sum(-8, -12)

# -3 -> 1101
# -2 -> 1110
# -1 -> 1111
# 0 -> 0000
# 1 -> 0001
# 2 -> 0010
# 3 -> 1101

# Video solution utilizing XOR and AND
# Run XOR bit by bit handles w/o carries
# AND then shift left by one to get carry values
# Repeat until no carry values left
def get_sum(a, b)
  mask = 0xffffffff
  until b.zero? # until no carries left
    tmp = (a & b) << 1 # carries
    a = (a ^ b) & mask # addition w/o carries
    b = tmp & mask
  end
  if a > (mask >> 1)
    a = ~(a ^ mask)
  end
  a
end

# Works on positive numbers
puts get_sum(825, 1234)
# Negative?
puts get_sum(-8, -12)