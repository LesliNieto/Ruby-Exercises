# Method that receives a number n and returns the factorial of that number.

class Factorial
  def initialize(n)
    @n = n
  end
  def factorial_number
    @n.zero? ? "1" : 1.upto(@n).inject(:*)
  end
end
 
 
print "Please enter a number: "
number = gets.chomp.to_i
num = Factorial.new(number)
puts  "Your result is:  #{ num.factorial_number }"