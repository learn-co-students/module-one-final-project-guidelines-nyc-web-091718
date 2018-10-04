# require './app/data/test.rb'

class Beer < ActiveRecord::Base
belongs_to :style

def self.sorting_beer(beer)
 b = Beer.find_by(name: beer)
 style= b.style_id #gives me style_id
   if style == 11 || style == 9
      "Gryffindor!"
   elsif style == 10 || style ==  6 || style ==  5
    "Slytherin!"
  elsif style == 8 || style == 7 || style == 3
      "Hufflepuff!"
   else style == 2 || style == 4 || style == 1
   "Ravenclaw!"
 end
end

def self.beer_rec(beer)
 bierre = Beer.find_by(name: beer)
 id = bierre.style_id
 recommendation = Beer.all.select { |b| b.style_id == id}
 rec = recommendation.map { |be| be.name }
 rec.sample
 # binding.pry
end

end
