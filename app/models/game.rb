class Game < ActiveRecord::Base
  validates :name, 
    presence: true, 
    uniqueness: {case_sensitive: false}
  has_many :decks, dependent: :destroy, inverse_of: :game
  has_many :users
end
