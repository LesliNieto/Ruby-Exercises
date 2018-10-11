#Method that receives a word and returns if it is palindrome or not. 

class PalindromicWords

  def initialize(word)
    @word = word.downcase
  end

  def palindromic_words
    @word.eql?(@word.reverse) ? "It's a palindrome word" : "It's not a palindrome word"
  end

end

#--------------TEST-------------------

require 'minitest/autorun'

class PalindromicWordsTest < Minitest::Test

  def setup
    @word = PalindromicWords.new("Lisa")
    @word_1 = PalindromicWords.new("ojo")
  end

  def test_instance_of_palindromic_words
    assert_instance_of(PalindromicWords, @word_1)
    assert_instance_of(PalindromicWords, @word)
  end

  def test_palindromic_words_true
    assert_equal("It's a palindrome word", @word_1.palindromic_words)
  end

  def test_palindromic_words_false
    assert_equal("It's not a palindrome word", @word.palindromic_words)
  end

end
#-----------------TESTSPEC----------------

describe PalindromicWords do

  before do
    @word = PalindromicWords.new("mono")
    @word_1 = PalindromicWords.new("Reconocer")
  end

  describe "when Insert  a word_true" do
    it "must be true" do
      @word_1.palindromic_words.must_equal("It's a palindrome word")
    end
  end

  describe "when insert a word_false" do
    it "must be false" do
      @word.palindromic_words.must_equal("It's not a palindrome word")
    end
  end

end
