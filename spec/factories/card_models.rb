# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :card_model do
    recto {"my_recto_#{srand.to_s[0..10]}"}
    verso {"my_verso_#{srand.to_s[0..10]}"}
    name  {"my_name#{srand.to_s[0..10]}"}
  end
end
