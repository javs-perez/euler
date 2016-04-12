# The decimal number, 585 = 10010010012 (binary), is palindromic in both bases.

# Find the sum of all numbers, less than one million, which are palindromic in base 10 and base 2.

# (Please note that the palindromic number, in either base, may not include leading zeros.)

palindromes = []

def palindrome?(string)
  string == string.reverse
end

(0..1000000).to_a.each do |n|
  if palindrome?(n.to_s) && palindrome?(n.to_s(2))
    palindromes << n
  end
end

p palindromes.reduce(:+)
