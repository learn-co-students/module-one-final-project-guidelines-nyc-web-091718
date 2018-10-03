class Game
  attr_accessor :running

  def initialize(running)
    @running = running
  end

  def make_npc
      print "Enter the number of NPCs you want: "
      x = gets.chomp
      x.times do Npc.create()
      end
  end

  def print_commands
  end

  def do_command(cmd)
    case cmd
    when "exit"
      @running = false
    when "help"
      print_commands
    else
      puts "#{cmd} is not a valid command"
    end
  end

  def start
    while running
      print "Enter command: "
      cmd = gets.chomp
      do_command(cmd)
    end
  end

end
