class Job < ActiveRecord::Base
  has_many :npcs
  has_many :characters
end
