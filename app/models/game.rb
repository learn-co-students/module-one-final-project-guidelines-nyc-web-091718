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

  def print_commands
    puts "Commands:"
    # exit
   # help
   # create npc custom
   # create npc random
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

  def world_menu(cmd) # cmd is an array
    case cmd[1]
    when "create";  # custom;
    when "print";   # attributes, towns;
    when "modify";  # by name; --> modify menu
    when "remove";  # by name;

    when "switch";  # --> switch world menu
    end
  end

  def town_menu(cmd) # cmd is an array
    case cmd[0]
    when "create";  # custom, random;
    when "print";   # attributes, citizens;
    when "modify";  # by name; --> modify menu
    when "remove";  # by name;
    end
  end

  def npc_menu(cmd) # cmd is an array
    case cmd[0]
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
    when "help";  print_commands;
    when "world"; world_menu(rmain_cmd); # TODO STOPPED HERE
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

  def create_world
    print "Enter the name of your World: "
    name = gets.chomp
    World.create(name: name)
  end

  def world_select
    puts "Select a world"
    puts "[0] New World"
    World.all.each do |w|
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
