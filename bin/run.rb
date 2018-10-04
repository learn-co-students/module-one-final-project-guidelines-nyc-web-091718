require_relative '../config/environment'
require_relative '../app/models/wizard.rb'
require 'pry'

# get_response()

puts "HELLO WORLD"
def one(character={})
  puts "- Input a character!"
  character = gets.chomp
  binding.pry
end
 # Faker::HarryPotter

# house = Faker::HarryPotter.house
# puts house
