require 'pry'

def welcome
  puts "Hello wine soon-to-be wine connoisseur!"
end

def get_initial_user_input
  puts "Would you like to SEARCH for a wine, REVIEW a wine, or get a RECOMMNEDATION?"
  puts "Type in an option below:"
  user_choice = gets.strip.downcase
  if user_choice == 'search'
    puts "Please pick a color: Red, White, or Pink"
    color_choice = gets.strip
    puts "Please pick a country:"
    country_choice = gets.strip
    puts "Please pick a year:"
    vintage_choice = gets.strip

    result = Wine.where(color: color_choice, country: country_choice, year: vintage_choice).all
    # "user_name = :user_name"
    if result[0]
      puts "I found you some dope vinosss"
      result.each do |wine|
        puts wine.name
      end
    else
      puts "I can't find any wine like that, sorry bub"
    end
  end
end

def try_again
  puts "Did you find the wine of your dreams?"
  puts "Yes or No"
  user_choice = gets.strip.downcase
  if user_choice == 'yes'
    puts "Yay! Would you like to leave a review or get a quick recommendation?"
    user_choice = gets.strip.downcase
  if user_choice == 'review'
    puts "Please put in wine name"
    user_choice = gets.strip.downcase
    #start here - go to the review path
   end
  end
    user_choice != 'no'
end

def say_bye
  puts 'coolio, bye!'
end
