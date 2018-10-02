class Town < ActiveRecord::Base
  has_many :npcs
  has_many :characters
  has_many :races, through: :npcs
  has_many :races, through: :characters
  has_many :families, through: :npcs
  has_many :families, through: :characters
  has_many :buildings
  belongs_to :location
end
