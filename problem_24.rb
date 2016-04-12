array = (0..9).to_a
permutations = array.permutation.map(&:join)

p permutations[999999]

