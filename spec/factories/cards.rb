require 'faker'

FactoryGirl.define do
  factory :card do
    card_model {FactoryGirl.create(:card_model)}
  end
end


