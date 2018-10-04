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

      if wine == false
        puts "Sorry we couldn't find your wine"
        initial_path_choice
      else
        create_review(user, wine)
        keep_searching = anything_else
      end




    elsif initial_path_choice == 'recommendation'
      recommendation
      keep_searching = anything_else

    elsif initial_path_choice == 'my wine reviews'
      user_reviews(user)
      #### Have option for update/delete
      keep_searching = anything_else
    else
      keep_searching = false
    end
end

say_bye



# keep_searching = true
#
# while keep_searching do
#   get_initial_user_input
#   keep_searching = try_again
# end
