class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string :face_up
      t.string :face_down
      t.string :name
      t.integer :deck_id

      t.timestamps
    end
  end
end
