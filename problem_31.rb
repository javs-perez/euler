# In England the currency is made up of pound, £, and pence, p, and there are eight coins in general circulation:

# 1p, 2p, 5p, 10p, 20p, 50p, £1 (100p) and £2 (200p).
# It is possible to make £2 in the following way:

# 1×£1 + 1×50p + 2×20p + 1×5p + 1×2p + 3×1p
# How many different ways can £2 be made using any number of coins?

require 'pry'

goal = 200
coins = [200, 100, 50, 20, 10, 5, 2, 1]

ways = [1]

200.times do
  ways << 0
end
coins.each do |coin|
  coin.upto(goal) do |x|
    ways[x] += ways[x-coin]
  end
end
ways[goal]

p ways[goal]
