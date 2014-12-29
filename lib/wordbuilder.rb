class WordBuilder
  require 'selenium-webdriver'

  attr_accessor :word

  def initialize(word_array)
    @words = WordBuilder.new(word_array)
    @errors = []
  end
 
  def error?(driver, word)
    begin 
      driver.find_element(:class, 'spellpron')
    rescue Selenium::WebDriver::Error::NoSuchElementError
      @errors.push(word)
      false
    end
  end

  def match?(driver, word)
    if name(driver) == word
      return true
    else
      @errors.push(word)
      return false
    end
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
