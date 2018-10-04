# require './app/data/test.rb'
require 'pry'

class Wizard < ActiveRecord::Base
  belongs_to :house
  has_many :styles, through: :house

  def self.fav_beers(char)
    

  end


end
