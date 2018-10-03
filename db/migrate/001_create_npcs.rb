class CreateNpcs < ActiveRecord::Migration[5.0]
  #define a change method in which to do the migration
  def change
    create_table :npcs do |t| #we get a block variable here for the table
      t.string :name
      t.string :race
      t.integer :age
      t.string :family
      t.string :status
      t.string :job
      t.string :personality
      t.integer :hp
      t.integer :wealth
    end
  end
end
# Still editing
