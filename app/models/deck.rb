class Deck < ActiveRecord::Base
  belongs_to :owner, class_name: 'User'
  belongs_to :game, inverse_of: :decks
  has_many :cards, inverse_of: :deck

  TOP    = 'TOP'
  BOTTOM = 'BOTTOM'
  RANDOM = 'RANDOM'
  VALID_PLACES = [TOP, BOTTOM, RANDOM]

  def shuffle
    l = cards.length
    indices = (0..l-1).to_a.shuffle
    for i in (0..l-1)
      cards[i].position = indices[i]
    end
  end

  def insert card, at
    raise ArgumentError, "Accepts only #{VALID_PLACES.join(' ,')}" \
      unless valid_arg?(at)
    case at
      when TOP
        cards << card
      when BOTTOM
        cards.unshift(card)
      when RANDOM
        cards.insert(rand(size + 1), card)
    end
  end

  def size
    cards.size
  end

  def draw from
    raise ArgumentError, "Accepts only #{VALID_PLACES.join(' ,')}" \
      unless valid_arg?(from)
    case from
      when TOP
        cards.pop
      when BOTTOM
        cards.shift
      when RANDOM
        cards.remove_at(rand(size))
    end
  end

  private
    
    def valid_arg? arg
      VALID_PLACES.include? arg
    end

end
