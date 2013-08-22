class CardModel < ActiveRecord::Base

  validates :name, presence: true
  validates :recto, presence: true
  validates :verso, presence: true

end
