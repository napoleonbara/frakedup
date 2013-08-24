class AddDeckTable < ActiveRecord::Migration
  def change
    create_table :decks do |t|
      t.string :name
    end

    create_table :cards_decks do |t|
      t.belongs_to :deck
      t.belongs_to :card
      t.integer    :rank
    end
  end
end
