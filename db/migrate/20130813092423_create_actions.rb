class CreateActions < ActiveRecord::Migration
  def change
    create_table :actions do |t|
      t.string :name
      t.integer :deck_from_id
      t.integer :deck_to_id
      t.integer :quantity
      t.integer :draw_mode
      t.integer :insert_mode
      t.integer :user_id

      t.timestamps
    end
  end
end
