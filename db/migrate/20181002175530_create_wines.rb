class CreateWines < ActiveRecord::Migration[5.0]
  def change
      create_table :wines do |t|
        t.string :name
        t.string :color
        t.string :country
        t.string :year
        t.integer :score
        t.string :url
    end
  end
end
