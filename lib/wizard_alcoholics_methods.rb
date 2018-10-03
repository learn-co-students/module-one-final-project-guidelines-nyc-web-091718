require 'pry'

require './app/data/test.rb'

def seed_db

  WIZARDS.each {|wiz| Wizard.new(name: wiz[:"name"])

  binding.pry}

end
