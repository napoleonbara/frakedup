class ChangeDeckUserToDeckOwner < ActiveRecord::Migration
  def change
    rename_column :decks, :user_id, :owner_id
  end
end
