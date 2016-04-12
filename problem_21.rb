# Let d(n) be defined as the sum of proper divisors of n (numbers less than n which divide evenly into n).
# If d(a) = b and d(b) = a, where a ≠ b, then a and b are an amicable pair and each of a and b are called amicable numbers.

# For example, the proper divisors of 220 are 1, 2, 4, 5, 10, 11, 20, 22, 44, 55 and 110; therefore d(220) = 284. The proper divisors of 284 are 1, 2, 4, 71 and 142; so d(284) = 220.

# Evaluate the sum of all the amicable numbers under 10000.

require 'prime'
require 'pry'

NUMBERS = {}
AMICABLE = []

def proper_divisors_of(number)
  primes, powers = number.prime_division.transpose
  exponents = powers.map{|i| (0..i).to_a}

  divisors = exponents.shift.product(*exponents).map do |powers|
    primes.zip(powers).map{|prime, power| prime ** power}.inject(:*)
  end

  sorted = divisors.sort
  sorted.pop
  sorted
end

def sum_of(array)
  array.inject(:+)
end

(2..10000).each do |number|
  array = proper_divisors_of(number)
  NUMBERS[number] = sum_of(array)
end

NUMBERS.each do |number, sum|
  if number != sum
    if NUMBERS[number] == sum && NUMBERS[sum] == number
      AMICABLE << number
      AMICABLE << sum
    end
  end
end

p AMICABLE.uniq.inject(:+)
