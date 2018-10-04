require 'pry'
require './app/data/test.rb'


def welcome
puts "Welcome to Wizard Alcoholics!"
puts "- To see what brew your favourite wizard is enjoying, type 1.
      - To see what house you belong in based on your preferences, type 2.
      - To give your wizard a beer & see what your wizard's reaction is, type 3.
      - To receive recommendations, type 4."

  input = gets.chomp
  if input == 1
    puts "Input a character!"
    char = gets.chomp
    fav_beers(char)
  elsif input == 2
    puts " Input a beer!"
    beer = gets.chomp
    sorting_beer(beer)
  elsif input == 3
    puts "Input a wizard & a beer! /n
              (ex. Harry Potter, Pumpkin Beer)"
    charbeer = gets.chomp
    drinking_wiz(charbeer)
  elsif input == 4
    puts "Input a beer, and you shall get recommendations!"
    beer = gets.chomp
    beer_rec(beer)
  else
    puts "Invalid input"
  end
end
