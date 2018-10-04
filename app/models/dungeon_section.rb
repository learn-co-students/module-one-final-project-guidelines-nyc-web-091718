class DungeonSection < ActiveRecord::Base
  belongs_to :world
  belongs_to :dungeon
  has_many :monsters

  def self.create_random(dungeon_id)
    x = Random.rand(1..10)
    x.times { DungeonSection.create(dungeon_id: dungeon_id) }
  end
end
