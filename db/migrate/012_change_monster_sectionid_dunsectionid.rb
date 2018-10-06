class ChangeMonsterSectionidDunsectionid < ActiveRecord::Migration[5.0]
  def change
    rename_column(:monsters, :section_id, :dungeon_sections_id)
  end
end
