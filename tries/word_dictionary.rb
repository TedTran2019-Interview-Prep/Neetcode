# Okay time limited exceeded again
class WordDictionary
  def initialize(root = {})
    @root = root
  end

  def add_word(word)
    curr = @root
    word.each_char do |char|
      curr[char] ||= {}
      curr = curr[char]
    end
    curr['END'] = true
  end

  def search(word)
    search_word(word, @root)
  end

  def search_word(word, root)
    return false if root.nil?
    if word.empty?
      return !!root['END']
    end

    curr = root
    word.each_char.with_index do |char, idx|
      if word[idx] != '.'
        return false unless curr[char]

        curr = curr[char]
      else
        return curr.keys.any? do |key| 
          key == 'END' ? false : search_word(word[(idx + 1)..-1], curr[key])
        end
      end
    end
    !!curr['END']
  end
end

# Time limit exceeded
class WordDictionary
  def initialize(root = {})
    @root = root
  end

  def add_word(word)
    curr = @root
    word.each_char do |char|
      curr[char] ||= {}
      curr = curr[char]
    end
    curr['END'] = true
  end

  def search(word)
    search_word(word, @root)
  end

  def search_word(word, root)
    return false if root.nil?
    if word.empty?
      return !!root['END']
    end

    if word[0] != '.'
      return search_word(word[1..-1], root[word[0]])
    else
      # root[key] == true due to 'END' check, RIP. So need a special clause to deal with that.
      return root.keys.any? do |key| 
        key == 'END' ? false : search_word(word[1..-1], root[key])
      end
    end
  end
end
