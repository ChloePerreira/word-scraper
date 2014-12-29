class WordBuilder
  require 'selenium-webdriver'

  attr_accessor :word

  def initialize(word_array)
    @words = WordBuilder.new(word_array)
  end
 
end
