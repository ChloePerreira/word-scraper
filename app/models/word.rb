class Word < ActiveRecord::Base
  serialize :pronunciation, Array
end
