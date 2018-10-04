# require './app/data/test.rb'

class Beer < ActiveRecord::Base
belongs_to :style

def self.sorting_beer(beer)

end

def self.beer_rec(beer)
  Beer.all.select {|beer| beer}
end

end
