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

number = PrimeFactor.new(600851475143)
puts number.prime_factor
