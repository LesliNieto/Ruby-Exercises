#The prime factors of 13195 are 5, 7, 13 and 29.
#What is the largest prime factor of the number 600851475143 ?

require 'prime'

class PrimeFactor

  def initialize(num)
    @num = num
  end
    
  def prime_factor
    Prime.prime_division(@num).flatten.max
  end

end

#--------------TEST-------------------

require 'minitest/autorun'

class PrimeFactorTest < Minitest::Test

  def setup
    @number = PrimeFactor.new(600851475143)
  end

  def test_instance_of_prime_factor
    assert_instance_of(PrimeFactor, @number)
  end

  def test_prime_factor
    assert_equal(6857, @number.prime_factor)
  end

end

#-----------------TESTSPEC--------------

describe PrimeFactor do

  before do
    @number_1 = PrimeFactor.new(600851475143)
  end

  describe "when Insert a number " do
    it "must gets the largest prime factor of the number inserted" do
      @number_1.prime_factor.must_equal(6857)
    end
  end

end