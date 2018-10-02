class Building < ActiveRecord::Base
  belongs_to :town
  belongs_to :location, through: :town
end
