# The number, 197, is called a circular prime because all rotations of the digits: 197, 971, and 719, are themselves prime.

# There are thirteen such primes below 100: 2, 3, 5, 7, 11, 13, 17, 31, 37, 71, 73, 79, and 97.

# How many circular primes are there below one million?

require 'prime'
require 'pry'

def rotations(x)
  digits = x.to_s.chars
  digits.map do
    digits.rotate!.join.to_i
  end
end

circular_primes = Prime.each(1000000).select do |p|
  rotations(p).all?{ |r| r.prime? }
end

p circular_primes.count
