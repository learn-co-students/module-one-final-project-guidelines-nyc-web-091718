class Game
  attr_accessor :running, :current_world

  def initialize(running)
    @running = running
    @current_world = nil
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

  def create_npc_custom
    print "Name : "
    name = gets.chomp
    print "Race : "
    race = gets.chomp
    print "Age  : "
    age = gets.chomp

    input = [name, race, age]
    Npc.create_custom(input)
  end

  def create_npc_random
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

  def print_npc_by_name(name)
    like_name = "%#{name}%"
    npc = Npc.where("name LIKE ?", like_name)
    # TODO when npc has multiple npcs in returned to it
    if !npc.empty?
      puts npc.first.name
    else
      puts "Could not find #{name}"
    end
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
    when "modify";  # by name; --> modify menu
    when "remove";  # by name;
    else; # User can enter "npc #{name} #{command}"
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
    when "npc";   npc_menu(rmain_cmd);
    else; puts "#{cmd} is not a valid command."
    end
  end

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
    World.all.each do |w|
      puts "[#{w.id}] #{w.name}"
    end
    print "Select World: "
    choice = gets.chomp
    case choice
    when '0'
      # Makes New World
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
