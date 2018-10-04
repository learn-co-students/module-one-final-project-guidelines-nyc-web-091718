require_relative '../../config/environment'
require_all 'lib'

# def get_data
#  headers = {
#    :accept => 'application/json',
#    :authorization => "Token #{ENV['API_KEY']}"
#  }
#   response_string = RestClient.get('https://api.globalwinescore.com/globalwinescores/latest/?color=white', headers)
#   response_hash = JSON.parse(response_string)
#    wines = response_hash["results"]
#   create_wines(wines)
# end
#
# def create_wines(wines)
#   wines.each do |wine|
#     wine_url = 'https://www.globalwinescore.com/wine-score/' + wine["wine_slug"]
#     Wine.create(name: wine['wine'],color: wine['color'], country: wine['country'],year: wine['vintage'],score: wine['score'], url: wine_url)
#   end
# end
