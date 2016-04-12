# Euler discovered the remarkable quadratic formula:

# n² + n + 41

# It turns out that the formula will produce 40 primes for the consecutive values n = 0 to 39. However, when n = 40, 402 + 40 + 41 = 40(40 + 1) + 41 is divisible by 41, and certainly when n = 41, 41² + 41 + 41 is clearly divisible by 41.

# The incredible formula  n² − 79n + 1601 was discovered, which produces 80 primes for the consecutive values n = 0 to 79. The product of the coefficients, −79 and 1601, is −126479.

# Considering quadratics of the form:

# n² + an + b, where |a| < 1000 and |b| < 1000

# where |n| is the modulus/absolute value of n
# e.g. |11| = 11 and |−4| = 4
# Find the product of the coefficients, a and b, for the quadratic expression that produces the maximum number of primes for consecutive values of n, starting with n = 0.

require 'prime'
require 'pry'

def formula(n:, a:, b:)
  ( n ** 2 ) + ( a * n ) + b
end

array = (-999..999).to_a

combinations = []
highest_combo = {a: '', b: '', count: 0}

array.each do |a|
  array.each do |b|
    combinations << [a, b]
  end
end

combinations.each do |a, b|
  count = 0

  (0..1000).to_a.each do |n|
    number = formula(n: n, a: a, b: b)
    if number.prime?
      count += 1
    else
      break
    end
  end

  if count > highest_combo[:count]
    highest_combo[:a] = a
    highest_combo[:b] = b
    highest_combo[:count] = count
    p "a: #{a}, b: #{b}, count: #{count}"
  end
end

p highest_combo
