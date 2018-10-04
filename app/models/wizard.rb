# require './app/data/test.rb'
# require 'pry'

class Wizard < ActiveRecord::Base
  belongs_to :house
  has_many :styles, through: :house

  def self.fav_beers(char)
    wiz = Wizard.find_by(name: char)
    wiz.house.styles.sample.beers.sample
  end

  def self.drinking_wiz(charbeer)

  end


end
