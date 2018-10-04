require_relative '../config/environment'
require 'pry'


user = welcome
initial_path_choice = get_initial_user_input
  if initial_path_choice == 'search'
    search
  elsif initial_path_choice == 'review'
    wine = review
    create_review(user, wine)
  elsif initial_path_choice == 'recommendation'
    recommendation
  end

say_bye



# keep_searching = true
#
# while keep_searching do
#   get_initial_user_input
#   keep_searching = try_again
# end
