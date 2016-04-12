require 'prime'
def triangle_numbers_up_to(x)
  triangle_numbers = []

  (1...x).inject(0) { |sum, n|
    triangle_numbers << sum
    sum + n
  }

  triangle_numbers
end

def factors_of(triangle_numbers)
  triangle_numbers.each do |num|
    unless num == 0 || num < 1000 || num % 2 != 0
      array = num.prime_division

      factor_count = []

      array.each do |a|
        factor_count << a[1] + 1
      end

      count = factor_count.inject { |mult, num| mult * num }
      p [count, num]
      return num if count >= 500
    end
  end
end

start_time = Time.now
p factors_of(triangle_numbers_up_to(100000))
end_time = Time.now

p end_time - start_time
