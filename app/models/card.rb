class Card < ActiveRecord::Base
  belongs_to :deck, inverse_of: :cards
end
