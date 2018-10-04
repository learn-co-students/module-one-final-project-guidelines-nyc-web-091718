class Npc < ActiveRecord::Base
  belongs_to :world
  belongs_to :town

  def self.create_random(world_id)
    name = Faker::Name.unique.name
    race = ApiController.race_hash.sample
    age = Random.new.rand(15..90)

    Npc.create(name: name, race: race, age: age, world_id: world_id)
  end

  def self.create_custom(input, world_id)
    name = input[0]
    race = input[1]
    age = input[2].to_i
    town_id = input[3].to_i
    Npc.create(name: name, race: race, age: age, world_id: world_id, town_id: town_id)
  end
end
