require_relative '../../config/environment'
require_all 'lib'

# def get_data
#  headers = {
#    :accept => 'application/json',
#    :authorization => "Token #{ENV['API_KEY']}"
#  }
#   response_string = RestClient.get('https://api.globalwinescore.com/globalwinescores/latest/?limit=10', headers)
#   response_hash = JSON.parse(response_string)
#    wines = response_hash["results"]
# end
