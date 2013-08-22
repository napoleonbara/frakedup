class Card < ActiveRecord::Base

  belongs_to :card_model
  validates  :card_model, presence: true

  def name
    self.card_model.name
  end

  def recto
    self.card_model.recto
  end

  def verso
    self.card_model.verso
  end

end
