require 'pry'

def welcome
  puts "Hello soon-to-be wine connoisseur!"
end

def get_initial_user_input
  puts "Would you like to SEARCH for a wine, REVIEW a wine, or get a RECOMMENDATION?"
  puts "Type in an option below:"
  user_choice = gets.strip.downcase
  exit if user_choice = 'exit'
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
  elsif user_choice == 'recommendation'
      recommendation
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
    #start here - go to the review path
    review
   end
  end
    user_choice != 'no'
end

def say_bye
  puts 'coolio, bye!'
end



def review
  puts "Please put in wine name"
  user_choice = gets.strip.downcase

  potential_matches = Wine.where("name like ?", "%#{user_choice}%")

  if potential_matches.length == 1
    puts "Is this the wine you wish to review? (yes or no)"
    puts potential_matches[0]['name']
    puts potential_matches[0]['year']
    yes_no = gets.chomp
  elsif potential_matches.length > 1
    list = potential_matches.each do |wine|
      "#{i}. #{wine['name']} -- #{wine['year']}"
    end
    puts "Which of these wines do you wish to review? (Enter number)"
    puts list
    id_input = gets.chomp
  else
    puts "We can't seem to find your wine. Please try searching again"
    get_initial_user_input
  end
end


def recommendation
  puts "Here's your recommendation:"
  wine = Wine.all.sample
  puts wine.name
  puts wine.year
  puts wine.country

  puts "Is there anything else? (yes or no)"
  anything_else = gets.chomp
  if anything_else == "yes"
    get_initial_user_input
  else
    say_bye
  end
end
