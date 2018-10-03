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
    # exit
   # help
   # create npc custom
   # create npc random
  end


  def create_npc_custom
    puts "Enter [name][race][age]"
    input = gets.chomp.split
    Npc.create_custom(input)
  end

  def create_npc_random
    Npc.create_random
  end

  def print_all_npcs
    puts Npc.all
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
    puts "select a world"
    puts "[0] New World"
    World.all.each do |w|
      puts "[#{w.id}] #{w.name}"
    end
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
      do_command(cmd)
    end
  end

end
