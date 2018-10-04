require_relative '../config/environment'
require 'pry'

user = welcome

keep_searching = true

while keep_searching do
initial_path_choice = get_initial_user_input
    if initial_path_choice == 'search'
      search
      keep_searching = anything_else
    elsif initial_path_choice == 'review'
      wine = review
      create_review(user, wine)
      keep_searching = anything_else
    elsif initial_path_choice == 'recommendation'
      recommendation
      keep_searching = anything_else
    end
end

say_bye



# keep_searching = true
#
# while keep_searching do
#   get_initial_user_input
#   keep_searching = try_again
# end
