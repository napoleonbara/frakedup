# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :cards_deck do
    card {FactoryGirl.create(:card)}
    deck {FactoryGirl.create(:deck)}
    rank {rand(30)}
  end
end
