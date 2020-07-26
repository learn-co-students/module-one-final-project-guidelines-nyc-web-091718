class Style < ActiveRecord::Base
  belongs_to :house
  has_many :beers
  has_many :wizards, through: :house

end
