class Action < ActiveRecord::Base

  has_one :deck_to, class_name: "Deck", foreign_key: "deck_to_id"
  has_one :deck_from, class_name: "Deck", foreign_key: "deck_from_id"
  belongs_to :user


  def execute
    cards = []
    quantity.times do
      cards << deck_from.draw(draw_mode)
    end
    quantity.times do
      deck_to.insert(cards.pop, insert_mode)
    end
  end

  def rollback

  end
end
