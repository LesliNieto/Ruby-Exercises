# Method that receives a number x and returns the factorial of that number.

def factorial_number(n)
  n.zero? ? "1" : 1.upto(n).inject(:*)
end

print "Please enter a number: "
number = gets.chomp.to_i
puts  "Your result is:  #{ factorial_number(number) }"
