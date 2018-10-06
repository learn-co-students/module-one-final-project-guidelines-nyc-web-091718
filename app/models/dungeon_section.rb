class DungeonSection < ActiveRecord::Base
  belongs_to :world
  belongs_to :dungeon
  has_many :monsters

  def self.create_random(world_id, dungeon_id)
    x = Random.rand(1..5)
    #binding.pry
    i = 1
    monsters = Monster.gen_rand_mons(Dungeon.last.dungeon_lvl)
    # TODO: This is super hacky and makes Max upset
    x.times do
      DungeonSection.create(world_id: world_id, dungeon_id: dungeon_id, section_id: i)
      mon = monsters.sample
      Monster.create(name: mon["name"], dungeon_id: dungeon_id, dungeon_section_id: DungeonSection.last.id, world_id: world_id)
    i += 1
    end
  end
end
