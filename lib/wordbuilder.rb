class WordBuilder
  require 'selenium-webdriver'

  def initialize(word_array, url_string)
    @words = WordBuilder.new(word_array)
    @url = url_string
    @bad_lookup_errors = []
    @word_mismatch_errors = []
    @bad_pronounce_errors = []
    @driver = build_driver
  end

  def build_profile
    profile = Selenium::WebDriver::Firefox::Profile.new
    profile['network.proxy.type']=1
    profile['network.proxy.socks']='127.0.0.1'
    profile['newtork.proxy.socks_port']=9050
    profile
  end 

  def build_driver
    driver = Selenium::WebDriver.for :firefox, :profile => build_profile
  end

# navigate your driver to something before calling @driver to fetch elements!

  def navigate(word)
    @driver.navigate.to @url+word
  end

  def cycle
    # cycle through your word array and navigate from page to page and do stuff
  end

  def error?(word)
    begin 
      @driver.find_element(:class, 'spellpron')
    rescue Selenium::WebDriver::Error::NoSuchElementError
      @bad_lookup_errors.push(word)
      false
    end
  end

  def match?(word)
    if name(@driver).downcase == word.downcase
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

  def name
    element = @driver.find_element(:class, 'js-headword')
    element.txt
  end

  def syllable_count

  end

  def syllable_emphasis
  end 

  def rank
  end

  def pronunciation(word) # can return false if there's an error
    element = @driver.find_element(:class, 'spellpron')
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
        @bad_pronounce_errors.push(word)
        false # put into a bin 
      end
    elsif pronunciation.include?(',') # then there's multiple pronunciations, get first
      pronunciation = pronuciation.match(/^.*\,/)[0][0..-2]
      clean_up(pronunciation)
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
