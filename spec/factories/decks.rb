require 'faker'

FactoryGirl.define do
  factory :deck do
    association :owner, factory: :user
  end

  factory :default_deck, class: Deck do
  end
end

