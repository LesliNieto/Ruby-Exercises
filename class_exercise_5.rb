# Method that receives a number n and returns the factorial of that number.

class Factorial

  def initialize(num)
    @num = num
  end

  def factorial_number
    @num.zero? ? "1" : 1.upto(@num).inject(:*)
  end

end
 
print "Please enter a number: "
number = gets.chomp.to_i
num = Factorial.new(number)
puts  "Your result is:  #{ num.factorial_number }"
