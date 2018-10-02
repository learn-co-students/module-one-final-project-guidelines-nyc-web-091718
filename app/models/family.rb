class Family < ActiveRecord::Base
  has_many :npcs
  has_many :characters
  has_many :races through: :npcs
  has_many :races through: :characters
end
