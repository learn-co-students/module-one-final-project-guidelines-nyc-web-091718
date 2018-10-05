

class ApiStuff
  name = Faker::Name.unique.name
  race = ApiController.race_hash.sample
  age = Random.new.rand(15..90)
  #binding.pry
end

# ApiController.request_and_parse()

# TODO: Create low/medium/high and random chest
# TODO: Make towns, npcs belong to town
# TODO: Make Player Characters
# TODO: Organize shit
# TODO: Add location, "wander feature"
# TODO: Assign NPCs to towns in do_commands
# TODO: Add dungeon, monsters, associations for them as well
# TODO: Make wilderness (NPCs with no town/Monsters with no dungeon)
# TODO: generate random, but gives user a choice to reroll
# TODO: make an inventory that interacts with chests. 1 chest per dung

# TODO: Make a "What is going on in their head meme" with trumpets
