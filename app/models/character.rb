class Character < ActiveRecord::Base
  belongs_to :family
  belongs_to :job
  belongs_to :race
  belongs_to :town
  belongs_to :entityclasstype
end
