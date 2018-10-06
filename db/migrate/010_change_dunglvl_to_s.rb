class ChangeDunglvlToS < ActiveRecord::Migration[5.0]
  def change
    change_column(:dungeons, :dungeon_lvl, :string)
  end
end
