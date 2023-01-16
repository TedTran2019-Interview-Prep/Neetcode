# Strictly increasing temperatures: Decreasing monotonic stack
def daily_temperatures(temperatures)
  answer = Array.new(temperatures.length, 0)
  mono_stack = []
  temperatures.each_with_index do |tmp, idx|
    while !mono_stack.empty? && tmp > mono_stack.last[0]
      _last_tmp, last_idx = mono_stack.pop
      answer[last_idx] = idx - last_idx
    end
    mono_stack << [tmp, idx]
  end
  answer
end
