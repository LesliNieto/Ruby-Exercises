#The prime factors of 13195 are 5, 7, 13 and 29.
#What is the largest prime factor of the number 600851475143 ?

def prime_factor(num)
  factor = 2
  until num == 1
    if (num % factor).zero?
      num = num.div(factor)
    else
      factor += 1
    end
  end
  factor
end

puts prime_factor(600851475143)
