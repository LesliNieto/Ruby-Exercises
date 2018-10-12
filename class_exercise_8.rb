#What is the 10001st prime number?

require 'prime'
 
class Primes
  
  def initialize(value)
    @value = value
  end

  def prime
    Prime.first(@value).last
  end
  
end

#--------------TEST-------------------

require 'minitest/autorun'

class PrimesTest < Minitest::Test

  def setup
    @num = Primes.new(10001)
  end

  def test_instance_of_primes
    assert_instance_of(Primes, @num)
  end

  def test_prime
    assert_equal(104743, @num.prime)
  end

end

#-----------------TESTSPEC-------------

describe Primes do

  before do
    @num_1 = Primes.new(10001)
  end

  describe "when insert a number" do
    it "must gets the prime number in the position given" do
      @num_1.prime.must_equal(104743)
    end
  end

end
