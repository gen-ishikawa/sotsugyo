# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#5.times do |n|
#  email = Faker::Internet.email
#  password = "pass123"
#  name = Faker::Name.name
#  User.create!(email: email,
#               password: password,
#               password_confirmation: password,
#               name: name,
#               uid: n
#               )
#end

#users = User.all

#users.each do |user| 
#  user.tweets.create(content: Faker::Food.dish) 
#end

#tweets = Tweet.all

#tweets.each do |tweet|
#  tweet.comments.create(content: Faker::Food.dish, user_id:1)
#end
Place.create([
  { name: '小栗原小', description: '小栗原ベアーズ', latitude: '35.711943', longitude: '139.943215', user_id: 1 },
  { name: '高瀬グランド', description: '船橋市営', latitude: '35.6725817', longitude: '139.9965212', user_id: 1 },
])

