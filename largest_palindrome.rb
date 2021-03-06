#A palindromic number reads the same both ways.
#The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.
#Find the largest palindrome made from the product of two 3-digit numbers.

def palindrome(num)
  num if num.to_s.eql?(num.to_s.reverse)
end 

def numbers
  biggest = 0
  (100...1000).each do |num1|
    (100...1000).each do |num2|
      product = num1 * num2
      biggest = product if product > biggest && palindrome(product)
    end
  end
  biggest
end 

puts numbers