class AddTableToUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
    end
  end
end ##end of class
