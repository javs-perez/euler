# The series, 11 + 22 + 33 + ... + 1010 = 10405071317.

# Find the last ten digits of the series, 11 + 22 + 33 + ... + 10001000.

array = (1..1000).to_a.map do |n|
  n ** n
end

p array.inject(:+).to_s.split('').last(10).join('')
