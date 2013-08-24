class Card < ActiveRecord::Base

  belongs_to :card_model
  validates  :card_model, presence: true

  delegate :name, :recto, :verso, to: :card_model

end
