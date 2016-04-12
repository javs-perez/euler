class CollatzConjecture
  def half(number)
    number / 2
  end

  def triple_plus_one(number)
    (number * 3) + 1
  end

  def pick(number)
    if number % 2 == 0
      half(number)
    else
      triple_plus_one(number)
    end
  end

  def iterate_until(number)
    hash = { starting_number: 0, longest_chain: 0 }
    (1..number).each do |subject|
      num = subject
      n = 1
      until num == 1 do
        num = pick(num)
        n += 1
      end
      if n > hash[:longest_chain]
        hash[:starting_number] = subject
        hash[:longest_chain] = n
      end
    end
    p hash
  end
end
