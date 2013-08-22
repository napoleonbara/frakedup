class CreatingCardsTable < ActiveRecord::Migration
  def change

    create_table :card_models do |t|
      t.string :recto
      t.string :verso
      t.string :name
    end

    create_table :cards do |t|
      t.belongs_to :card_model
    end
  end
end
