class AddWorldToNpcs < ActiveRecord::Migration[5.0]
  def change
    add_column :npcs, :world_id, :integer
  end
end
