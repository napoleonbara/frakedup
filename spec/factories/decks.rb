# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :deck do
    name {"my_name_#{srand.to_s[0..10]}"}
  end
end
