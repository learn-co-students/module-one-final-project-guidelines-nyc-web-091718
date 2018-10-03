class Npc < ActiveRecord::Base
  def self.create_random_npc
    name = Faker::Name.unique.name
    Npc.create(name: name, )
  end
end
