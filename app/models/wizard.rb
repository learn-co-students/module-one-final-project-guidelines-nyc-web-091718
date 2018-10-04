# require './app/data/test.rb'
# require 'pry'

class Wizard < ActiveRecord::Base
  belongs_to :house
  has_many :styles, through: :house

  def self.fav_beers(char)
    wiz = self.find_by(name: char)
    # binding.pry
    beer = wiz.house.styles.sample.beers.sample
    # binding.pry
    beer
  end

  def self.drinking_wiz(charbeer)
      cbarray = charbeer.split(", ")
      char = Wizard.find_by(name: cbarray[0])
      beer = Beer.find_by(name: cbarray[1])
      if char.house.styles.include?(beer.style)
        "Wow this is great!"
        # binding.pry
      else
        "Bleugh what is this??"
        # binding.pry
      end
  end
end
