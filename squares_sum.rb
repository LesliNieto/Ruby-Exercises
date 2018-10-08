=begin
The sum of the squares of the first ten natural numbers is,
12 + 22 + ... + 102 = 385
The square of the sum of the first ten natural numbers is,
(1 + 2 + ... + 10)2 = 552 = 3025
Hence the difference between the sum of the squares of the first ten natural numbers
and the square of the sum is 3025 − 385 = 2640.
Find the difference between the sum of the squares of the first one hundred natural
numbers and the square of the sum. 
=end 


def square(num)
  square_of_sum = ( 1.upto(num).reduce(:+) ** 2 )
  sum_of_squares = ( 1.upto(num).collect { |num_1| num_1 ** 2 }.sum )
  square_of_sum - sum_of_squares
end

puts square(100)
