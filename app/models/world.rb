class World < ActiveRecord::Base
  has_many :npcs
  has_many :towns
  has_many :dungeons
  has_many :monsters
  has_many :dungeon_rooms
end
