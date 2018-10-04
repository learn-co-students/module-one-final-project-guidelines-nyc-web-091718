require_relative '../config/environment'
require 'pry'


user = welcome
get_initial_user_input
# keep_searching = true
#
# while keep_searching do
#   get_initial_user_input
#   keep_searching = try_again
# end
wine = review
create_review(user, wine)
say_bye
