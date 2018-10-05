class AddSectionIds < ActiveRecord::Migration[5.0]
  def change
    add_column :dungeon_sections, :section_id, :integer
  end
end
