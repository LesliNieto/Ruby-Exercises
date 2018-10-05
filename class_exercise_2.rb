#Each new term in the Fibonacci sequence is generated by adding 
#the previous two terms. By starting with 1 and 2, the first 10 terms will be:
#1, 2, 3, 5, 8, 13, 21, 34, 55, 89, ...
#By considering the terms in the Fibonacci sequence whose values do not 
#exceed four million, find the sum of the even-valued terms.

class Fibonacci 
  def initialize(max)
    @max = max
  end

  def even_numbers_fibonacci
    fibo_array = [1, 1]
    (1...@max).each { fibo_array << fibo_array.last(2).sum }
    even_numbers = fibo_array.select { |num| num.even? }
    even_numbers.sum
  end
end

fibo = Fibonacci.new(100)

puts fibo.even_numbers_fibonacci
