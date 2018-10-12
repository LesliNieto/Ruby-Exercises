#A palindromic number reads the same both ways.
#The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.
#Find the largest palindrome made from the product of two 3-digit numbers.

class PalindromicNumber

  def initialize(max)
    @max = max
  end

  def palindrome(num)
    num if num.to_s.eql?(num.to_s.reverse)
  end 

  def numbers
    biggest = 0
    (100..@max).each do |num_1|
      (100..@max).each do |num_2|
        product = num_1 * num_2
        biggest = product if product > biggest && palindrome(product)
      end
    end
    biggest
  end 
end



#--------------TEST-------------------

require 'minitest/autorun'

class PalindromicNumberTest < Minitest::Test

  def setup
    @number = PalindromicNumber.new(999)
  end

  def test_instance_of_palindromic_number
    assert_instance_of(PalindromicNumber, @number)
  end

  def test_numbers
    assert_equal(906609, @number.numbers)
  end

end

#-----------------TESTSPEC---------------

describe PalindromicNumber do

  before do
   @number_1 = PalindromicNumber.new(1000)
  end

  describe "when insert a 3-digit number" do
    it "Must gets the largest palindrome made from the product of two 3-digit numbers" do
      @number_1.numbers.must_equal(906609)
    end
  end

end