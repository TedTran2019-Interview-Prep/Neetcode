OPS = %w[+ - * /].freeze

def eval_rpn(tokens)
  stack = []
  tokens.each do |token|
    if OPS.include?(token)
      second = stack.pop
      first = stack.pop
      result = if token == '/'
                 first.fdiv(second).truncate
               else
                 eval("#{first} #{token} #{second}")
               end
      stack << result
    else
      stack << token.to_i
    end
  end
  stack.first
end
