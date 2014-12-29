class WordBuilder
  require 'selenium-webdriver'

  attr_accessor :word

  def initialize(word_array)
    @words = WordBuilder.new(word_array)
    @bad_lookup_errors = []
    @word_mismatch_errors = []
    @bad_pronounce_errors = []
  end
 
  def error?(driver, word)
    begin 
      driver.find_element(:class, 'spellpron')
    rescue Selenium::WebDriver::Error::NoSuchElementError
      @bad_lookup_errors.push(word)
      false
    end
  end

  def match?(driver, word)
    if name(driver).downcase == word.downcase
      return true
    else
      @word_mismatch_errors.push(word)
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

  def pronunciation(driver) # can return false if there's an error
    element = driver.find_element(:class, 'spellpron')
    pronunciation = element.txt
    if pronunciation ~= /\d/
      # deal with some shit because there're numbers in it
      pronunciation.gsub!(/\d.+/, '') # deletes numbers and everything after
      array = pronunciation.split(' ')
      if array[-1] == "for"
        array.pop
        pronunciation = array.join
        clean_up(pronunciation)
      else # return false of something goes wrong
        false # put into a bin 
      end
    else
      clean_up(pronunciation)
    end
  end

  def clean_up(pronunciation)
    pronunciation.gsub!(/\s+/, "") # remove spaces
    pronunciation.gsub!(/\[|\]/, "") # remove []
    syllable_array = pronunciation.split('-')
    syllable_array
  end

  
end
