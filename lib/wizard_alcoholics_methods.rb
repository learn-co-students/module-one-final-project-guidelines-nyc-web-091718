require 'pry'
require './app/data/test.rb'



def one(character)
  puts "- Input a character!"
  character = gets.chomp
end

def two
  puts "- Input a beer!"
end

def three
  puts
end

def four

end


def welcome
puts "Welcome to Wizard Alcoholics!"
puts "- To see what brew your favourite wizard is enjoying, type 1.
      - To see what house you belong in based on your preferences, type 2.
      - To give your wizard a beer & see what your wizard's reaction is, type 3.
        - Input wizard & beer (ex. Harry Potter, Pumpkin Beer)
      - To receive recommendations, type 4."

  input = gets.chomp
  if input == 1
    one
  elsif input == 2
    two
  elsif input == 3
    three
  elsif input == 4
    four
  else
    puts "Invalid input"
  end
end

def seed_db

  WIZARDS.each  {|wiz| wiz[:name]}

end
