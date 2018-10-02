class EntityClassType < ActiveRecord::Base
  has_many :npcs
  has_many :characters
  has_many :families through: :npcs
  has_many :families through: :characters
  has_many :abilities
end
