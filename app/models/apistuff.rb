

class ApiStuff

  def self.pick_a_dungeon
    active = true
    Dungeon.all.each do |d|
      puts "*" * 11
      puts "ID: #{d.id}"
      puts "Name: #{d.name}"
      puts "LVL: #{d.dungeon_lvl}"
      puts "World ID: #{d.world_id}"
      puts "*" * 11
    end
    puts "Select the ID of the Dungeon you wish to inspect!"

    while active == true
      print "Dungeon ID: "
      id = gets.chomp
      if Dungeon.exists?(id)
        puts "*" * 11
        puts "ID: #{Dungeon.find(id).id}"
        puts "Name: #{Dungeon.find(id).name}"
        puts "LVL: #{Dungeon.find(id).dungeon_lvl}"
        puts "World ID: #{Dungeon.find(id).world_id}"
        puts "*" * 11
        puts "Now showing the contents of #{Dungeon.find(id).name}"
        section_monsters = Monster.where(["dungeon_id = ?", id])
        mon_iterate = 1
          section_monsters.each do |m|
            puts "*" * 11
            puts "Section #{mon_iterate}: #{m.name}"
            mon_iterate += 1
          end
          active = false
      else
          puts "Invalid ID, please enter a valid Dungeon ID."
      end
    end
  end


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
