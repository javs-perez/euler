# 145 is a curious number, as 1! + 4! + 5! = 1 + 24 + 120 = 145.

# Find the sum of all numbers which are equal to the sum of the factorial of their digits.

# Note: as 1! = 1 and 2! = 2 are not sums they are not included.

require 'pry'

integers = []

CACHE = {}

def factorial_of(n:)
  return 1 if n == 1 || n == 0
  CACHE["#{n}"] || CACHE["#{n}"] = (1..n).reduce(:*)
end

(11..100000).to_a.each do |n|
  array = n.to_s.split('').map { |i| factorial_of(n: i.to_i)}

  int = array.inject(:+)

  if int == n
    integers << n
  end
end

p integers.reduce(:+)
