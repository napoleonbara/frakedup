class Deck < ActiveRecord::Base
  belongs_to :user
  belongs_to :game, inverse_of: :decks
  has_many :cards, inverse_of: :deck, :order => 'cards.position DESC'

  def shuffle
    l = cards.length
    indices = (0..l-1).to_a.shuffle
    for i in (0..l-1)
      cards[i].position = indices[i]
    end
  end

end
