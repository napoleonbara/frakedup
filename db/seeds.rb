# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# Create an admin user
puts "Creating the seed user"
SignInToken.create
usr = User.new login: 'admin', password: 'admin password', password_confirmation: 'admin password', privilege: 'admin', sign_in_token: SignInToken.last.text
unless usr.save
  puts usr.errors.messages
end
