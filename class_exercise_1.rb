#If we list all the natural numbers below 10 that are multiples of 3 or 5, 
#we get 3, 5, 6 and 9. The sum of these multiples is 23.
#Find the sum of all the multiples of 3 or 5 below 1000.

class MultiplesOf
  def initialize(m3, m5, max)
    @m3 = m3
    @m5 = m5
    @max = max
  end
  
  def multiples_3_5
    (1...@max).select {|number| ( number % @m3 ).zero? || ( number % @m5 ).zero? }.inject(:+)
  end
end

multiples = MultiplesOf.new(3, 5, 1000)
puts multiples.multiples_3_5
