class Npc < ActiveRecord::Base
  belongs_to :world

  def self.create_random
    name = Faker::Name.unique.name
    race = ApiController.race_hash.sample
    age = Random.new.rand(15..90)

    Npc.create(name: name, race: race, age: age)
  end

  def self.create_custom(input)
    name = input[0]
    race = input[1]
    age = input[2].to_i

    Npc.create(name: name, race: race, age: age)
  end
end
