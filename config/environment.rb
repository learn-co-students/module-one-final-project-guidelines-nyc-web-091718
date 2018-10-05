require 'bundler'
# require 'colorize'
# require 'colorized_string'
# require 'csv'
# require 'json'
# require 'pry'
# require 'require_all'



Bundler.require

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.db')
require_all 'lib'
require_all 'app'
require_relative '../db/seeds'
