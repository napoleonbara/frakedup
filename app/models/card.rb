class Card < ActiveRecord::Base
  validates :recto, presence: true
  validates :verso, presence: true
end
