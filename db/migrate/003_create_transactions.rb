class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.string :name
      t.integer :cash_balance
      t.integer :user_id
      t.integer :stock_id
    end
  end
end
