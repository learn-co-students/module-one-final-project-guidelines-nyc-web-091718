class Monster < ActiveRecord::Base
  belongs_to :world
  belongs_to :dungeon
  belongs_to :dungeon_section

  def self.lvl_range(dl)
    case dl
    when "begginer"
      [0,3]
    when "challenge"
      [3,8]
    when "dangerous"
      [8,15]
    when "deadly"
      [15,30]
    end
  end

  def self.gen_rand_mons(dungeon_lvl)
    monsters = ApiController.monster_hash
    mm = lvl_range(dungeon_lvl)
    min = mm[0]
    max = mm[1]
    mon = monsters.select do |m|
      #binding.pry
      ApiController.request_and_parse(m["url"])["challenge_rating"] > min && ApiController.request_and_parse(m["url"])["challenge_rating"] < max
    end
    mon
  end
end
