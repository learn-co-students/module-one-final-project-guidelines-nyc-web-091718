# require 'pry'
# require './app/data/test.rb'


def welcome
  puts "



     #.         ,@@@.                                                                 #          :@@@`                                        @@@@;                                  .
   @@@    ,#@#   @@@          ;                                                    `@@@    :#@'   @@@                             `:          @@+@.     .              ,             #
   `@@    @@@`   +@'          @                                                     `@@    @@@    #@;                             `@          @@,@'     @              @            .#
    @@`   +@@    `@          #@                                     `                @@    #@@    .@                              `@,         @@ @#    ;@             '@            @#
    ,@+    @@    +@          @@                                     '                :@'    @@    #@    #@                        `@@         @@ @@    @@             @@           '@# #@`
     @@   `@@.   @@         ..@                                     @                 @@   .@@`   @@    @@:                       `@'`        @@ @@   , @            ,`@            @+ @@'
     @@   '@@@   @'     #@@  :@                           @@@       @                 @@   #@@#   @:    #@           #@    ;`     `@`         @@ @@    `@             .@`           @+ #@`         ,+
     :@,  @#@@  .@     #@+@: ;@            +;            ###@.     @@                 '@.  @#@@  ,@                 #@@@  @@@     `@`        `@@ @@,   .@             ,@`           @+             @@
      @#  @;;@. +@     @@`@# '@  .@@      #'@#       `   @+,@'    .@@@;                @#  @,'@` #@                 ++ @:,@#@'    `@`        `@# @@+   ,@   @@        :@`           @+   `   ;@#  @ @,
      @@ `@  @# @@    `@@ @@ +@ ;@ @#  #@   ,@`  @; ;@@ `@+ @#     '@      @+          @@ .@  @# @#      #  `@@@@@@ `  @@ @+@@  .`.@`      : :@' #@@:  :@ ,@ @@  '@   ;@.      @@   @+  +`  #@.@;@# @`
      '@ '@  @@ @'    `@@@@@ @@ @#    @#@@   @+ @@@@@@@..@@@@#     '@    .@,@:         +@ #@  @@ @;     `@` .@@@@@;    @@ @+@` @@@.@      ,: '@: @@#   '@ @@    @@+@  +@.'@` `@:@+  @+  @.  @:   @' `
       @'@@  ;@'@`    .@@.@@ @@ @,   ;@,@@`  @@@@@@@# @@,@+,@#     '@   `@@#@@         `@;@#  '@+@      @@` .    @   @+@@ @+  @@`@,@       @,#@'@@@@   '@ @'   .@,@@` +@@@@@,@@+@@  @' @@.  @    @:
       @@@'   @@@     .@#    @@ @   `@@'.@.  @@#  @#  @@,@'        '@   ;@@`@@          @@@:  `@@@      :@` ,   #+  +@ @@ @+  @@  ,@       `@@@@#;@@   +@ @.   #@# @: +@@,'@@@@`#@  @' ,@. .@    @@@@`
       +@@`   @@@     .@+    @@ @    #@ .@,  @@   @#  @@:@;        '@    @# @@          #@@    @@@       @`     @   @@ @@ @+  @@  :@         @@  `@@   +@ @`   +@  @; #@`  @@@@ #@  @'  @. ;@    '; @#
       `@@    :@@     ,@' ;  @@ @    #@ .@,  @@   @+  @#;@: ;      '@    @# @@          .@@    '@@       @`    '#  ,@@ @@ @+  @@  :@         @@   @@.  #@ @`   '@  @' #@   @@@@ #@  @'  @. ;@     . @@
        @@     @@+    :@+ @` @@ @    #@ .@,  @@   @'  @+'@: @      '@    @# @@           @@     @@'      @`    @   '@@ @@ @+  @@  ;@        .@@   @@;  @@ @.   '@  @' @@   @@@@ #@  @'  @. ;@    '; @+
        #+     @@@     @# @  @@ @.   +@ .@,  @@   @;  @' @' @      '@    @# @@           #;     @@@      @`   ;@   #@@ @@ @+  @@  ;@        ;@@   @@#  @@ @;   ;@  @' @@   @+@@ #@  @;  @. :@    #::@
        ..     :@@,    :@.:  @@ @' ; +@ .@,  @@   @.  @: '@:.      '@    @# @@           ,`     '@@.     @.   @    @+@@@';@+  @@  '@        +@#   '@@  @@ @@ + :@  @; @@   @;@@ #@ `@;  @,  @`,. .@@
                #@@ @@  @@   @@ :@:@';@ .@`  @@   @   @.  @@       ;@ #@`@# @@                   #@@ @@  @.  ,@+@@@@`@ @ .@@: @@  @@        @@@   .@@  @@ .@,@#,@  @. @@   @,@@ #@ .@;  @,  #'+@` @
                 .@`'#       @@  @@,  @`@@   @@   @   @,            ;@`@ +@`@'                    ,@`++ `@.  @@@@+,            @+@@`        ```    @@  @@  @@:  @.#@  @@   @`;@ @# ,@; `@,   @@`
                   @@       +@@`      '@@.  #@@; :@  `               .@   @@@                       @@  +@.                    .@@;                @@,;@@`      :@@: ;@@` ;@` @@@  @@@ ;@,
                                                                                                       `@@,                                                                           `@@:
                                                                                                         #@:                                                                            #@:


"


end

def methods
  puts "
  -Type 1 to see what brew your favourite wizard is enjoying!
  -Type 2 to see what house you belong in based on your preferences!
  -Type 3 to give your wizard a beer & see what your wizard's reaction is!
  -Type 4 to receive recommendations!
  -Type 5 to exit"
    input = gets.strip.to_i
    # binding.pry
    if input == 1
      puts "Input a character!"
      char = gets.strip
      # binding.pry
      favbeer = Wizard.fav_beers(char)
      # binding.pry
      puts favbeer
      methods
    elsif input == 2
      puts "Input a beer!"
      beer = gets.strip
      beerhouse = Beer.sorting_beer(beer)
      puts "Hmmm... #{beerhouse}"
      methods
    elsif input == 3
      puts "Input a wizard & a beer!
                (ex. Harry Potter, Pumpkin Beer)"
      charbeer = gets.chomp
      wizdrink = Wizard.drinking_wiz(charbeer)
      puts wizdrink
      methods
    elsif input == 4
      puts "Input a beer, and you shall get recommendations!"
      beer = gets.chomp
      recs = Beer.beer_rec(beer)
      puts "Our wizards recommend #{recs}!"
      methods
    elsif input == 5
      puts "Mischief Managed"
    else
      puts "Invalid input"
      methods
    end


end

def runner
  puts "Password?"
  password = gets.strip
  if password == "I solemnly swear that I am up to no good"
    welcome
    methods
  else
    puts "Wrong password, goodbye."
  end

end
