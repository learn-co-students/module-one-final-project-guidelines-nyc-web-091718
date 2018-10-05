class Dungeon < ActiveRecord::Base
  belongs_to :world
  has_many :dungeon_sections
  has_many :monsters

  def self.create_random(world_id)
    name = "#{Faker::Cannabis.strain} Dungeon"
    d_names = Dungeon.all.map {|d| d.name}
      while d_names.include?(name)
        name = "#{Faker::Cannabis.strain} Dungeon"
      end
    #dungeon_lvl = Random.new.rand(1..20)
    dungeon_lvl = ["begginer","challenge","dangerous","deadly"].sample
    #binding.pry
    dungeon = Dungeon.create(name: name, dungeon_lvl: dungeon_lvl, world_id: world_id)
    d_section = DungeonSection.create_random(world_id, dungeon.id)
  end

  # def self.create_custom(input, world_id)
  #   name = input[0]
  #   dungeon_lvl = input[1]
  #
  #   Dungeon.create(name: name, dungeon_lvl: dungeon_lvl, world_id: world_id)
  # end

  def self.list_difficulties
    puts "Beginner = (1-3)"
    puts "Challenge = (4-7)"
    puts "Dangerous = (8-14)"
    puts "Deadly = (15+)"
  end

end
