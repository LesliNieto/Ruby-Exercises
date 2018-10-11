#the previous two terms. By starting with 1 and 2, the first 10 terms will be:
#1, 2, 3, 5, 8, 13, 21, 34, 55, 89, ...
#By considering the terms in the Fibonacci sequence whose values do not 
#exceed four million, find the sum of the even-valued terms.

class Fibonacci
 
  def initialize(max)
    @max = max
  end

  def even_numbers_fibonacci
    fibo_array = [1, 1]
    (1...@max).each { fibo_array << fibo_array.last(2).sum }
    even_numbers = fibo_array.select { |num| num.even? }
    even_numbers.sum
  end
  
end

#--------------TEST-------------------

require 'minitest/autorun'

class FibonacciTest < Minitest::Test

  def setup
    @number = Fibonacci.new(10)
  end

  def test_instance_of_fibonacci
    assert_instance_of(Fibonacci, @number)
  end

  def test_even_numbers_fibonacci
    assert_equal(44, @number.even_numbers_fibonacci)
  end

end

#-----------------TESTSPEC--------------

describe Fibonacci do

  before do
    @number_1 = Fibonacci.new(10)
  end

  describe "when Insert a number" do
    it "must gets the even numbers sum of the fibonacci sequence" do
      @number_1.even_numbers_fibonacci.must_equal(44)
    end
  end

end
