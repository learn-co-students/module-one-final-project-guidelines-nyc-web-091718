class RemoveMonsterColumns < ActiveRecord::Migration[5.0]
  def change
    remove_column(:monsters, :level)
    remove_column(:monsters, :hp)
  end
end
