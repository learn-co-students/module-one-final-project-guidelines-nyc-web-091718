class Town < ActiveRecord::Base
  has_many :npcs
  belongs_to :world

  def self.create_random(world_id)
    name = Faker::ElderScrolls.city

    Town.create(name: name, world_id: world_id)
  end

  def self.create_custom(input, world_id)
    name = input[0]

    Town.create(name: name, world_id: world_id)
  end

end
