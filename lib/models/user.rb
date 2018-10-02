require 'pry'

class User < ActiveRecord::Base
  has_many :reviews
  has_many :wines, through: :reviews
end
