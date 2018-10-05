# require './app/data/test.rb'
# require 'pry'

class Wizard < ActiveRecord::Base
  belongs_to :house
  has_many :styles, through: :house

  def self.fav_beers(char)
    wiz = self.find_by(name: char)
    # binding.pry
    house = wiz.house.name
    # binding.pry
    beer = wiz.house.styles.sample.beers.sample
    # binding.pry
    house_colors("I'm drinking #{beer.name}!", house)
  end


  def self.drinking_wiz(charbeer)
      cbarray = charbeer.split(", ")
      char = Wizard.find_by(name: cbarray[0])
      beer = Beer.find_by(name: cbarray[1])
      house = char.house.name
      if char.house.styles.include?(beer.style)
        # binding.pry
        house_colors("Wow this is great!", house)
        # binding.pry
      else
        # binding.pry
        house_colors("Bleugh what is this??", house)
        # binding.pry
      end
  end

  def self.house_colors(string, house)
    if house == "Gryffindor"
      string.yellow.on_red
    elsif house == "Slytherin"
      string.white.on_green
    elsif house == "Hufflepuff"
      string.black.on_yellow
    else
      string.light_black.on_blue
    end
  end
end
