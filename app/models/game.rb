class Game
  attr_accessor :running, :current_world

  def initialize(running)
    @running = running
    @current_world = nil
    @current_town = nil
  end

  def make_npc
      print "Enter the number of NPCs you want: "
      x = gets.chomp
      x.times do Npc.create()
      end
  end

  def print_commands(menu)
    #puts "Commands:"
    main_menu_content =
    "
    Main Menu:
      > pry ----- [Opens Pry Console]
      > exit ---- [Quits Program]
      > help ---- [Prints All Commands]
      > world --- [Opens World Menu]
      > town ---- [Opens Town Menu]
      > dungeon - [Opens Dungeon Menu]
      > npc ----- [Opens Npc Menu]
    ".colorize(:blue)
    world_menu_content =
    "
    World Menu:
      > create --------- [Creates New World]
      > print
          > all -------- [Prints All World Names]
          > current ---- [Prints Current World Name]
      > switch --------- [Switch to different World]
      > [World Name]
          > remove ----- [Deletes World]
    ".colorize(:light_green)
    town_menu_content =
    "
    Town Menu:
      > create --------- [Creates New Town]
      > print
          > all -------- [Prints All Towns Names]
      > [Town Name]
          > remove ----- [Deletes Town]
    ".colorize(:light_yellow)
    dungeon_menu_content =
    "
    Dungeon Menu:
      > create
          > random ----- [Generates Random Dungeon]
      > print
          > all -------- [Prints All Dungeon Names]
      > tree ----------- [Prints Entities in a Dungeon]
      > [Dungeon Name]
          > remove ----- [Deletes Dungeon]
    ".colorize(:red)
    npc_menu_content =
    "
    Npc Menu:
      > create
          > custom ----- [Creates Custom Npc]
          > random ----- [Creates Random Npc]
      > print
          > all -------- [Prints All Towns Names]
          > [Npc Name] - [Prints Npc]
      > [Npc Name]
          > stats ------ [Prints Npc Stats]
          > modify ----- [Modifys Npc]
          > remove ----- [Deletes Npc]
    ".colorize(:light_blue)

    case menu
    when "all"
      puts main_menu_content
      puts world_menu_content
      puts town_menu_content
      puts dungeon_menu_content
      puts npc_menu_content
    when "world"; puts world_menu_content;
    when "town"; puts town_menu_content;
    when "dungeon"; puts dungeon_menu_content;
    when "npc"; puts npc_menu_content;
    end

  end

  def create_npc_custom # DONE
    print "Name : "
    name = gets.chomp
    print "Race : "
    race = gets.chomp
    print "Age  : "
    age = gets.chomp
    input = [name, race, age]

    if @current_world != nil
      world_id = @current_world.id
    else
      world_id = nil
    end

    if @current_town != nil
      town_id = @current_town.id
    else
      town_id = nil
    end

    Npc.create_custom(input, town_id, world_id)
  end

  def create_npc_random # DONE
    if @current_world != nil
      Npc.create_random(@current_world.id)
    else
      Npc.create_random(nil)
    end
  end

  def print_all_npcs # TODO print more than just name?
    all_npcs = Npc.all
    all_npcs.each {|n| puts n.name}
  end

  def print_all(obj) # TODO print more than just name?
    #binding.pry
    all = obj.all # MAY FAIL ON DUNCGEONSECTIONS
    all_names = []
    all.each {|o| all_names << o.name}
    return all_names
    # all_npcs = Npc.all
    # all_npcs.each {|n| puts n.name}
  end

  def find_npc_by_name(name)
    like_name = "%#{name}%"
    npc = Npc.where("name LIKE ?", like_name)
    if npc.size == 1
      return npc.first
    elsif npc.size > 1
      puts "Which #{name} were you looking for?"
      npc.each_with_index {|n,i| puts "[#{i}]: #{n.name}"}
      choice = gets.chomp
      return npc[choice.to_i]
    else
      puts "Could not find #{name}"
      return 0
    end
  end

  def find_obj_by_name(obj, name)
    like_name = "%#{name}%"
    foo = obj.where("name LIKE ?", like_name)
    if foo.size == 1
      return foo.first
    elsif foo.size > 1
      puts "Which #{name} were you looking for?"
      foo.each_with_index {|n,i| puts "[#{i}]: #{n.name}"}
      choice = gets.chomp
      return foo[choice.to_i]
    else
      puts "Could not find #{name}"
      return 0
    end
  end

  def find_objs_by_parent_id(obj, pid={})
    binding.pry
    obj.select {|o| o[pid.first.first] == pid.first.last}
  end

  def print_npc_by_name(name) # DONEish, Modify to use find_npc_by_name
    like_name = "%#{name}%"
    npc = Npc.where("name LIKE ?", like_name)
    # TODO when npc has multiple npcs in returned to it
    if !npc.empty?
      puts npc.first.name
    else
      puts "Could not find #{name}"
    end
  end

  def print_npc_stats(name)
    npc = find_npc_by_name(name)
    atr_hash = npc.attributes
    atr_hash.each {|k,v| puts "#{k}: #{v}"}
  end

  def print_attributes_by_object(obj)
    obj.attributes.each {|k,v| puts "#{k}: #{v}"}
  end

  def modify_npc_by_name(name)
    npc = find_npc_by_name(name)
    npc_atrs = npc.attributes.map {|k,v| k}
    # print_attributes_by_object(npc)

    modifying = true

    while modifying
      print_attributes_by_object(npc)
      puts "\nEnter '!!!' to Exit"
      print "Attribute: "
      atr = gets.chomp
      if atr == '!!!'
        modifying = false
        break
      elsif npc_atrs.include? atr
        print "New Value: "
        val = gets.chomp # TODO make sure they enter right values
        npc[atr.to_sym] = val
        npc.save
      else
        puts "Invalid Attribute"
      end
      #binding.pry
    end
  end

  def remove_npc_by_name(name)
    npc = find_npc_by_name(name)
    npc.delete
  end

  def remove_by_obj(obj)
    obj.delete
  end

  def tree_print
    children = []
    binding.pry
  end

  def create_world
    print "Enter the name of your World: "
    name = gets.chomp
    @current_world = World.create(name: name)
  end

  def create_town
    print "Enter the name of your Town: "
    name = gets.chomp
    @current_town = Town.create(name: name)
  end

  def create_dungeon_random
    if @current_world != nil
      Dungeon.create_random(@current_world.id)
    else
      Dungeon.create_random(nil)
    end
  end

  def upcomming_feature
    puts "This feature is on its way";
  end

  def world_menu(cmd) # cmd is an array
    case cmd[0]
    when "help"; print_commands("world");
    when "create";  create_world; # custom;
    when "print";   # attributes, towns;
      case cmd[1]
      when "all"; print_all(World).each {|w| puts w};
      when "current";
        if @current_world != nil
           puts @current_world.name
         end
      end
    when "switch";  world_select;# --> switch world menu
    else
      case cmd[1]
      when "tree"; # tree_print;# prints everything in this world
      when "modify"; upcomming_feature;
      when "remove";
        w = find_obj_by_name(World, cmd[0])
        remove_by_obj(w)
      end
    end
  end

  def town_menu(cmd) # cmd is an array
    case cmd[0]
    when "help"; print_commands("town");
    when "create"; create_town; # custom, random;
    when "print";   # attributes, citizens;
      case cmd[1]
      when "all"; print_all(Town).each {|t| puts t};
      end
    else
      case cmd[1]
      when "modify";  # by name; --> modify menu
      when "remove";  # by name;
        t = find_obj_by_name(Town, cmd[0])
        remove_by_obj(t)
      end
    end
  end

  def dungeon_menu(cmd) # cmd is an array
    case cmd[0]
    when "help"; print_commands("dungeon");
    when "create";
      case cmd[1]
      when "random"; create_dungeon_random;
      end
    when "print";   # attributes, citizens;
      case cmd[1]
      when "all"; print_all(Dungeon).each {|t| puts t};
      end
    when "tree";
      ApiStuff.pick_a_dungeon
    else
      case cmd[1]
      when "modify";  # by name; --> modify menu
      when "remove";  # by name;
        d = find_obj_by_name(Dungeon, cmd[0])
        remove_by_obj(d)
      end
    end
  end

  def npc_menu(cmd) # cmd is an array
    case cmd[0]
    when "help"; print_commands("npc");
    when "create";  # custom, random;
      case cmd[1]
      when "custom"; create_npc_custom;
      when "random"; create_npc_random;
      end
    when "print";   # all, by name;
      case cmd[1]
      when "all"; print_all_npcs;
      else; print_npc_by_name(cmd[1]);
      end
    # when "modify";  # by name; --> modify menu
    # when "remove";  # by name;
    else # User can enter "npc #{name} #{command}"
      #binding.pry
      case cmd[1]
      when "stats"; print_npc_stats(cmd[0]);
      when "modify"; modify_npc_by_name(cmd[0]);
      when "remove"; remove_npc_by_name(cmd[0]);
      end
    end
  end

  def do_command_1(cmd)
    split_cmd = cmd.downcase.split
    first_cmd = cmd.first
    rmain_cmd = split_cmd[1..split_cmd.size] # Remaining Commands

    case split_cmd[0]
    when "pry";   binding.pry;
    when "exit";  @running = false;
    when "help";  print_commands("all");
    when "world"; world_menu(rmain_cmd);
    when "town";  town_menu(rmain_cmd);
    when "dungeon"; dungeon_menu(rmain_cmd);
    when "npc";   npc_menu(rmain_cmd);
    else; puts "#{cmd} is not a valid command."
    end
  end

    # TODO: Do not touch
  def do_command(cmd)
    split_cmd = cmd.split
    case split_cmd[0]
    when "pry"
      binding.pry
    when "exit"
      @running = false
    when "help"
      print_commands
    when "create"
      case split_cmd[1]
      when "npc"
        case split_cmd[2]
        when "custom"
          create_npc_custom
        when "random"
          create_npc_random
        end
      #when "town"
      end
    when "print"
      case split_cmd[1]
      when "npcs"
        case split_cmd[2]
        when "all"
          print_all_npcs
        end
      end
    else
      puts "#{cmd} is not a valid command"
    end
  end

  def world_select
    puts "Select a world"
    puts "[0] New World"
    World.all.each_with_index do |w,i|
      puts "[#{w.id}] #{w.name}"
    end
    print "Select World: "
    choice = gets.chomp
    case choice
    when '0'
      create_world
    else
      @current_world = World.find {|w| w.id == choice.to_i}
    end
  end

  def start
    world_select
    while running
      print "Enter command: "
      cmd = gets.chomp
      do_command_1(cmd)
    end
  end

end
