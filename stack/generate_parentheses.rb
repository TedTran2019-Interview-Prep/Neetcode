# Array contains: parentheses itself, # opening brackets, # closing brackets
def generate_parenthesis(n)
  answers = []
  generate_parens(n, ['', 0, 0], answers)
  answers
end

# Instead of duping, can just pop off to return to previous state
def generate_parens(n, info, answers)
  return nil if info[2] > info[1]
  return nil if info[1] > n

  if info[1] == n && info[1] == info[2]
    answers << info[0]
    return nil
  end

  new_info_open = [info[0].dup, info[1] + 1, info[2]]
  new_info_open[0] << '('
  new_info_close = [info[0].dup, info[1], info[2] + 1]
  new_info_close[0] << ')'
  generate_parens(n, new_info_open, answers)
  generate_parens(n, new_info_close, answers)
end
