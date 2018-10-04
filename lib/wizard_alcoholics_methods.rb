# require 'pry'
# require './app/data/test.rb'


def welcome
puts "Welcome to Wizard Alcoholics!"
puts "-Type 1 to see what brew your favourite wizard is enjoying! \n
-Type 2 to see what house you belong in based on your preferences! \n
-Type 3 to give your wizard a beer & see what your wizard's reaction is! \n
-Type 4 to receive recommendations!"

  input = gets.strip.to_i
  # binding.pry
  if input == 1
    puts "Input a character!"
    char = gets.strip
    # binding.pry
    favbeer = Wizard.fav_beers(char)
    # binding.pry
    puts "#{char} is drinking #{favbeer.name}"
  elsif input == 2
    puts "Input a beer!"
    beer = gets.strip
    beerhouse = Beer.sorting_beer(beer)
    puts "Hmmm... #{beerhouse}"
  elsif input == 3
    puts "Input a wizard & a beer! /n
              (ex. Harry Potter, Pumpkin Beer)"
    charbeer = gets.chomp
    wizdrink = Wizard.drinking_wiz(charbeer)
    puts wizdrink
  elsif input == 4
    puts "Input a beer, and you shall get recommendations!"
    beer = gets.chomp
    recs = Beer.beer_rec(beer)
    puts "Our wizards recommend #{recs}!"
  else
    puts "Invalid input"
  end
end
