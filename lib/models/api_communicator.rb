require 'rubygems' if RUBY_VERSION < '1.9'
require 'rest-client'
require 'json'
require 'pry'

headers = {
  :accept => 'application/json',
  :authorization => "Token <ENV['API_KEY']>"
}
binding.pry

# def all_wines_from_api
  # make the web request
  response_string = RestClient.get('https://api.globalwinescore.com/globalwinescores/latest/', headers)
  # parse data from api
  response_hash = JSON.parse(response_string)
  # Get the array of all the wines
  wines = response_hash["results"]
  puts wines
  # binding.pry
# end

def print_wines(wines)
  wines.each do |wine|
    puts print_wine(wine)
  end
end

  def print_wine(wine)
    puts "*" * 30
    puts wine['wine_slug']
    puts wine['color']
    puts wine['country']
    puts wine['vintage']
    puts wine['score']
  end
