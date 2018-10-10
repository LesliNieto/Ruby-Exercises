require 'prime'
 
class Primes
  
  def initialize(value)
    @value = value
  end

  def prime
    Prime.first(@value).last
  end
  
end

num = Primes.new(10001)
puts num.prime