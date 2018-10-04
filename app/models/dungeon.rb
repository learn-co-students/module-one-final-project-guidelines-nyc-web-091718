class Dungeon < ActiveRecord::Base
  belongs_to :world
  has_many :dungeon_sections
  has_many :monsters

  def self.create_random(world_id)
    name = "#{Faker::Cannabis.strain} Dungeon"
    dungeon_lvl = Random.new.rand(1..20)

    Dungeon.create(name: name, dungeon_lvl: dungeon_lvl, world_id: world_id)
    DungeonSection.create_random(dungeon_id: self.id)
  end

  def self.create_custom(input, world_id)
    name = input[0]
    dungeon_lvl = input[1]

    Dungeon.create(name: name, dungeon_lvl: dungeon_lvl, world_id: world_id)
  end

  def self.list_difficulties
    puts "Beginner = (1-3)"
    puts "Challenge = (3-7)"
    puts "Dangerous = (8-14)"
    puts "Deadly = (15+)"
  end

end
