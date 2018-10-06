class CreateMonsters < ActiveRecord::Migration[5.0]
  def change
    create_table :monsters do |t|
      t.string :name
      t.integer :level
      t.integer :hp
      t.integer :dungeon_id
      t.integer :section_id
      t.integer :world_id    
    end
  end
end
