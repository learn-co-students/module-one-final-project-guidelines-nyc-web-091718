require 'bundler'
require 'csv'
require 'json'
require 'pry'
# require 'faker'

Bundler.require

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.db')
require_all 'lib'
