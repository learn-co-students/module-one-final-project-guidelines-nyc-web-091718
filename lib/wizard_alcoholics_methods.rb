require 'pry'

require './app/data/test.rb'

def seed_db

  WIZARDS.each {|wiz| wiz[:name]}

end
