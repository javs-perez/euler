require 'pry'

def longest_repeating_decimal(last)
  n = (3..last).max_by { |i| find_repeating(i).size }
end

def find_repeating(n)
  num = 1
  a = []
  remainders = {}
  loop do
    d,r = num.divmod(n)
    return '' if r.zero?
    a << d
    return a[remainders[r]..-1].join if remainders.key?(r)
    remainders[r] = a.size
    num = 10*r
  end
end


p longest_repeating_decimal(999)
