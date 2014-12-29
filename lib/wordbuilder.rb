class WordBuilder
  require 'selenium-webdriver'

  attr_accessor :word

  def initialize(word_array)
    @words = WordBuilder.new(word_array)
  end
 
  def create
  end

  def name(driver)
    element = driver.find_element(:class, 'js-headword')
    element.txt
  end

  def syllable_count
  end

  def syllable_emphasis
  end 

  def rank
  end

  def pronunciation
  end
end
