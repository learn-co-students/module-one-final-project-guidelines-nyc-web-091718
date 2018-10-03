# require 'csv2json'
# require 'csv'
# require 'json'
# require 'pry'

# binding.pry
beers = CSV.parse(File.open('./app/models/data/beers.csv').read) #.to_json
styles = CSV.parse(File.open('./app/models/data/styles.csv').read) #.to_json
categories = CSV.parse(File.open('./app/models/data/categories.csv').read) #.to_json
binding.pry
# require_relative '../../../beers.json'
#
# beers = File.open('../../resources/beers.csv', 'r') do |input|
#     File.open('beers.json', 'w') do |output|
#         CSV2JSON.parse(input, output)
#     end
# end

0
