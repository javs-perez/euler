require 'pry'
array = []
IO.foreach('problem_67_pyramid.txt') do |line|
  array << line.split(' ').map { |n| n.to_i }
end

until array.size == 1 do
  array[-2].each_with_index do |n, i|
    first_num = n + array[-1][i]
    sec_num = n + array[-1][i + 1]
    if first_num > sec_num
      array[-2][i] = first_num
    else
      array[-2][i] = sec_num
    end
  end
  array.delete_at(-1)
end

p array
