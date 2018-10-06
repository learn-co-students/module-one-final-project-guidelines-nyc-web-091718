class CreateDungeons < ActiveRecord::Migration[5.0]
  def change
    create_table :dungeons do |t|
      t.string :name
      t.integer :dungeon_lvl
      t.integer :world_id
    end
  end
end
