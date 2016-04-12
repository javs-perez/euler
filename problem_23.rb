# A perfect number is a number for which the sum of its proper divisors is exactly equal to the number. For example, the sum of the proper divisors of 28 would be 1 + 2 + 4 + 7 + 14 = 28, which means that 28 is a perfect number.

# A number n is called deficient if the sum of its proper divisors is less than n and it is called abundant if this sum exceeds n.

# As 12 is the smallest abundant number, 1 + 2 + 3 + 4 + 6 = 16, the smallest number that can be written as the sum of two abundant numbers is 24. By mathematical analysis, it can be shown that all integers greater than 28123 can be written as the sum of two abundant numbers. However, this upper limit cannot be reduced any further by analysis even though it is known that the greatest number that cannot be expressed as the sum of two abundant numbers is less than this limit.

# Find the sum of all the positive integers which cannot be written as the sum of two abundant numbers.

require 'prime'
require 'pry'

abundant_numbers = []
sums = []
positive_integers = []

def proper_divisors_of(number)
  primes, powers = number.prime_division.transpose
  unless powers.nil?
    exponents = powers.map{|i| (0..i).to_a}

    divisors = exponents.shift.product(*exponents).map do |powers|
      primes.zip(powers).map{|prime, power| prime ** power}.inject(:*)
    end

    sorted = divisors.sort
    sorted.pop
    sorted
  end
end

(1..28123).each do |number|
  divisors = proper_divisors_of(number)
  unless divisors.nil?
    sum = divisors.inject(:+)

    if sum > number
      abundant_numbers << number
    end
  end
end


abundant_numbers.each do |number|
  abundant_numbers.each do |number2|
    sum = number + number2
    if sum < 28123
      sums << sum
    end
  end
end

uniq_sums = sums.uniq

(1..28123).each do |number|
  puts number
  unless uniq_sums.include? number
    positive_integers << number
  end
end

positive_integers.pop
p positive_integers.inject(:+)
