class CreateStocks < ActiveRecord::Migration[5.2]
  def change
    create_table :table do |t|
      t.string :name
      t.string :ticker
    end
  end
end
