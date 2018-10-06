class AddTownToNpcs < ActiveRecord::Migration[5.0]
  def change
    add_column :npcs, :town_id, :integer
  end
end
