require './app/data/test.rb'

class House  < ActiveRecord::Base
has_many :wizards
has_many :housestyles
end
