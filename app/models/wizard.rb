# require './app/data/test.rb'
require 'pry'

class Wizard < ActiveRecord::Base
belongs_to :house

def one(character)
  puts "- Input a character!"
  character = gets.chomp
  binding.pry
end

end
