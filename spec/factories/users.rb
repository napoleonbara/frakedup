require 'faker'

FactoryGirl.define do

  factory :user do
    login                 { Faker::Name.first_name }
    password              "user password"
    password_confirmation "user password"
    privilege             "normal"
    sign_in_token         { create(:sign_in_token).text }
  end

end

