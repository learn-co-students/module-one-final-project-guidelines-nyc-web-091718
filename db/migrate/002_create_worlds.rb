class CreateWorlds < ActiveRecord::Migration[5.0]
  def change
    create_table :worlds do |t|
      t.string :name
    end
  end
end
