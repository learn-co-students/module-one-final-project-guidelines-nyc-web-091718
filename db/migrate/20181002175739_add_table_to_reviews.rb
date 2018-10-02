class AddTableToReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.integer :user_id
      t.integer :wine_id
      t.string :content
      t.integer :rating
    end
  end
end
