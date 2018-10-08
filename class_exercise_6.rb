#Method that receives a word and returns if it is palindrome or not. 

class PalindormicWords
  def initialize(word)
    @word = word 
    
  end

  def palindromic_words
    @word.eql?(@word.reverse) ? "It's a palindrome word " : "It's not a palindrome word"
  end
end

print "Enter a word to verify -> "
words = gets.chomp.downcase.to_s
word_a = PalindormicWords.new(words)
puts word_a.palindromic_words
