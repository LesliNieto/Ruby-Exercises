#If we list all the natural numbers below 10 that are multiples of 3 or 5, 
#we get 3, 5, 6 and 9. The sum of these multiples is 23.
#Find the sum of all the multiples of 3 or 5 below 1000.

class MultiplesOf

  def initialize(num_1, num_2, max)
    @num_1 = num_1
    @num_2 = num_2
    @max = max
  end
  
  def multiples
    (1...@max).select {|number| ( number % @num_1 ).zero? || ( number % @num_2 ).zero? }.inject(:+)
  end
  
end

#--------------TEST-------------------


require 'minitest/autorun'

class MultiplesTest < Minitest::Test

  def setup
    @num = MultiplesOf.new(3, 5, 1000)
  end

  def test_instance_of_multiples_of
    assert_instance_of(MultiplesOf, @num)
  end

  def test_multiples
    assert_equal(233168, @num.multiples)
  end

end

#-----------------TESTSPEC--------------

describe MultiplesOf do

  before do
    @num_1 = MultiplesOf.new(3, 5, 1000)
  end

  describe "When insert 2 numbers and a limit" do
    it "Must gets the sum of the all multiples of two numbers below the limit" do
      @num_1.multiples.must_equal(233168)
    end
  end

end
