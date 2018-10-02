require 'bundler'
Bundler.require

require 'dotenv'
Dotenv.load

require 'pry'
binding.pry

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.db')
require_all 'lib'
#may need to change require
