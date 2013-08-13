class Action < ActiveRecord::Base

  belongs_to :deck_to, :class_name => "Deck", :foreign_key => "deck_to_id"
  belongs_to :deck_from, :class_name => "Deck", :foreign_key => "deck_from_id"
  belongs_to :user

  TOP = 1
  BOTTOM = 2
  RANDOM = 3

  def execute
    cards = []
    for i in (1..quantity)
      case draw_mode
      when TOP
        cards << deck_from.cards.pop
      when BOTTOM
        cards << deck_from.cards.shift
      when RANDOM
        cards << deck_from.cards.remove_at(rand(deck_from.cards.size))
      end
    end
    for i in (1..quantity)
      card = cards.pop
      case insert_mode
      when TOP
        deck_to.cards << card
      when BOTTOM
        deck_to.cards.unshift(card)
      when RANDOM
        deck_to.cards.insert(rand(deck_to.cards.size + 1), card)
      end
    end
  end
end
