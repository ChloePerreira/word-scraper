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
    if name(driver).downcase == word.downcase
      return true
    else
      @errors.push(word)
      return false
    end
  end

  def create
    # check for errors
    # check for match
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

  def pronunciation(driver)
    element = driver.find_element(:class, 'spellpron')
    pronunciation = element.txt
    if pronunciation ~= /\d/
      # deal with some shit because there're numbers in it
    else
      pronunciation.gsub!(/\s+/, "") # remove spaces
      pronunciation.gsub!(/\[|\]/, "") # remove []
      syllable_array = pronunciation.split('-') 
  end
end
