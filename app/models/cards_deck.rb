class CardsDeck < ActiveRecord::Base

  belongs_to :card
  belongs_to :deck

  validates :card, :deck, :rank, presence: true
end
