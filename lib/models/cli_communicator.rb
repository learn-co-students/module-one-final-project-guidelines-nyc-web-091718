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



def review
  puts "Please enter the name of the wine that you wish to review:"
  response_name = gets.chomp
  puts "Please enter the year or vintage of this wine:"
  response_year = gets.chomp

  potential_matches = Wine.where("name like ?", "%#{response_name}%")

  matched_by_year = potential_matches.map do |wine|
    if wine.year = response_year
      wine.id
      wine.name
    end
  end

  if matched_by_year.length == 1
    puts "Is this the wine you wish to review? (yes or no)"
    puts matched_by_year
    yes_no = gets.chomp
  elsif matched_by_year.length > 1
    puts matched_by_year
    puts "Which of these wines do you wish to review? (Enter ID number)"
    id_input = gets.chomp
  else
    puts "We can't seem to find your wine. Please try searching again"
  end
end


def suggestion
  puts "Here's your suggestion:"
  wine = Wine.all.sample
  puts wine.name
  puts wine.year
  puts wine.country
end
