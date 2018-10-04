require_relative '../config/environment'
# require_relative '../app/models/wizard.rb'
# require 'pry'

# get_response()

puts "run run"
seed_houses
seed_wizards
seed_styles
seed_beers
puts "end run"

# puts "HELLO WORLD"
# def one(character={})
#   puts "- Input a character!"
#   character = gets.chomp
#   binding.pry
# end
 # Faker::HarryPotter

# house = Faker::HarryPotter.house
# puts house
