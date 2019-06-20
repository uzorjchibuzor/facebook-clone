# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Users
User.create!(first_name: 'Example',
             last_name: 'User',
             email: 'user@foobar.org',
             date_of_birth: Time.now - 24.years,
             password: 'foobar',
             password_confirmation: 'foobar',
             confirmed_at: Time.zone.now)

99.times do |n|
  last_name = Faker::Name.last_name
  first_name = Faker::Name.first_name
  email = "fake-user-#{n + 1}@foobar.org"
  password = 'password'
  User.create!(first_name: first_name,
               last_name: last_name,
               email: email,
               password: password,
               date_of_birth: Time.now - 24.years,
               password_confirmation: password,
               confirmed_at: Time.zone.now)
end

# posts
# users = User.order(:created_at).take(6)
# 50.times do
#  content = Faker::Lorem.sentence(5)
#  users.each { |user| user.microposts.create!(content: content) }
# end

# Folloowing relationships

# users = User.all
# user  = users.first
# following = users[2..50]
# followers = users[3..40]
# following.each { |followed| user.follow(followed) }
# followers.each { |follower| follower.follow(user) }
