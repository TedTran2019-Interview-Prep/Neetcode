# @param {Integer} n, a positive integer
# @return {Integer}
# Binary string of length 32
def hamming_weight(n)
  n.to_s(2).count('1');
end
