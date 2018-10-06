class CreateDungeonSections < ActiveRecord::Migration[5.0]
  def change
    create_table :dungeon_sections do |t|
      t.integer :world_id
      t.integer :dungeon_id
    end
  end
end
