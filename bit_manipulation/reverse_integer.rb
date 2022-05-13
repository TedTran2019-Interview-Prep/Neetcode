# @param {Integer} x
# @return {Integer}
def reverse(x)
  max = 0xffffffff >> 1
  neg = 1
  if x < 0
    neg *= -1
    x *= -1
  end

  reverse = x.to_s.reverse.to_i # Store inside of 32 bit UNSIGNED.
  return 0 if reverse > max

  reverse * neg
end

# 354 % 10 = 4
# 354 /= 10 = 35
# 4 * 10 + 5... 45 * 10 + 3...
def simple_reverse(x)
  reverse = 0
  neg = 1
  if x < 0
    neg *= -1
    x *= -1
  end

  until x.zero?
    digit = x % 10
    reverse = (reverse * 10) + digit
    x /= 10
  end
  reverse * neg
end

# Reverse all but last digit
# Then check if reversed value == max value (w/o last digit)
# Check if last digit of reversed is greater than last digit of max value
# If so, return zero. Otherwise, return reversed
# It rounds down.. towards the next negative. A fmod would be useful here...
def reverse(x)
  max = 0xffffffff >> 1
  max_last_digit = max % 10
  max_minus_digit = max / 10
  reverse = 0
  neg = 1
  if x.negative?
    neg *= -1 # This would overflow if input is MAX. Unless you stored in an unsigned 32 bit
    x *= -1
  end
  until x < 10
    digit = x % 10
    reverse = (reverse * 10) + digit
    x /= 10
  end
  digit = x % 10
  return 0 if reverse > max_minus_digit
  return 0 if reverse == max_minus_digit && digit > max_last_digit

  ((reverse * 10) + digit) * neg
end

## Can utilize #abs OR check if reverse is less than the min
# min = (max * -1) - 1
def reverse(x)
  max = 0xffffffff >> 1
  max_last_digit = max % 10
  max_minus_digit = max / 10
  reverse = 0
  until x.zero?
    digit = x.remainder(10)
    if reverse.abs > max_minus_digit || (reverse.abs == max_minus_digit && digit > max_last_digit)
      return 0
    end
    reverse = (reverse * 10) + digit
    x = (x / 10.0).to_i
  end
  reverse
end
