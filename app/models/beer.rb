require './app/data/test.rb'

class Beer < ActiveRecord::Base
belongs_to :styles

end
