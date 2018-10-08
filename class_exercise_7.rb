#Find the difference between the sum of the squares of the first one hundred natural
#numbers and the square of the sum. 
#end 

class SquareDifference
  def initialize(num)
    @num = num
  end

 def square
  square_of_sum = ( 1.upto(@num).reduce(:+) ** 2 )
  sum_of_squares = ( 1.upto(@num).collect { |num_1| num_1 ** 2 }.sum )
  square_of_sum - sum_of_squares
  end

end
 
number = SquareDifference.new(100)
puts number.square