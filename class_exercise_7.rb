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
 
#--------------TEST-------------------

require 'minitest/autorun'

class SquareDifferenceTest < Minitest::Test

  def setup
    @number = SquareDifference.new(100)
  end

  def test_instance_of_square_difference
    assert_instance_of(SquareDifference, @number)
  end

  def test_square
    assert_equal(25164150, @number.square)
  end

end

#-----------------TESTSPEC----------------

describe SquareDifference do

  before do
    @number_1 = SquareDifference.new(100)
  end

  describe "when insert a number" do
    it "must gets the difference between the sum of the squares and the square of the sum" do
      @number_1.square.must_equal(25164150)
    end
  end

end
