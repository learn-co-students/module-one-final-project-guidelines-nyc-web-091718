class Race < ActiveRecord::Base
  has_many :characters
  has_many :npcs
end
