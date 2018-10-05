class ChangeMonsterSectionidDunsectionid2 < ActiveRecord::Migration[5.0]
  def change
    rename_column(:monsters, :dungeon_sections_id, :dungeon_section_id)
  end
end
