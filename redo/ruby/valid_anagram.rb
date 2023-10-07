# @param {String} s
# @param {String} t
# @return {Boolean}
def is_anagram(s, t)
  return false unless s.length == t.length

  characters = Hash.new(0)
  s.each_char.with_index do |char, idx|
    characters[char] += 1
    characters[t[idx]] -= 1
  end
  return false unless characters.values.all?(&:zero?)

  true
end
