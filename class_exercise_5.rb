# Method that receives a number n and returns the factorial of that number.

class Factorial

  def initialize(num)
    @num = num
  end

  def factorial_number
    @num.zero? ? "1" : 1.upto(@num).inject(:*)
  end

end

#--------------TEST-------------------

require 'minitest/autorun'

class FactorialTest < Minitest::Test

  def setup
    @number = Factorial.new(5)
  end

  def test_instance_of_factorial
    assert_instance_of(Factorial, @number)
  end

  def test_factorial_number
    assert_equal(120, @number.factorial_number)
  end
end

#-----------------TESTSPEC--------------

describe Factorial do

  before do
    @number_1 = Factorial.new(5)
  end

  describe "when Insert a  number" do
    it "must gets the factorial of the number inserted" do
      @number_1.factorial_number.must_equal(120)
    end
  end

end
