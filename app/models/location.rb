class Location < ActiveRecord::Base
  has_many :towns
  has_many :buildings #??
end
