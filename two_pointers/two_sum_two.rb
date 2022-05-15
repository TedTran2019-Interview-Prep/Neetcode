# frozen_string_literal: true

# @param {Integer[]} numbers
# @param {Integer} target
# @return {Integer[]}
# Array is already sorted
def two_sum(numbers, target)
  idx_start = 0
  idx_end = numbers.length - 1
  while idx_start < idx_end
    case numbers[idx_start] + numbers[idx_end] <=> target
    when 1
      idx_end -= 1
    when 0
      return [idx_start + 1, idx_end + 1]
    when -1
      idx_start += 1
    end
  end
  nil
end

numbers = [2, 7, 11, 15]
target = 9
print two_sum(numbers, target)

numbers = [2, 3, 4]
target = 6
print two_sum(numbers, target)

numbers = [-1, 0]
target = -1
print two_sum(numbers, target)
