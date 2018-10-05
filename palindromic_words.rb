#Method that receives a word and returns if it is palindrome or not. 

def palindromic_words(word)
  word.eql?(word.reverse) ? "It's a palindrome word " : "It's not a palindrome word"
end

print "Enter a word to verify -> "
words = gets.chomp.downcase.to_s
puts palindromic_words(words)
