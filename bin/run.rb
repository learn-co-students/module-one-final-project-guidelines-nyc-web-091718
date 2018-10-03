require_relative '../config/environment'
require 'pry'


welcome
user = check_user('Devon')
binding.pry
keep_searching = true

while keep_searching do
  get_initial_user_input
  keep_searching = try_again
end

say_bye
