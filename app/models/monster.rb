class Monster < ActiveRecord::Base
  belongs_to :world
  belongs_to :dungeon
end
