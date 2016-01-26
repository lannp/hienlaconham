# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
15.times do |n|
  email = "long#{n+1}@gmail.com"
  User.create!(
    name: FFaker::Name.name ,
    email: email,
    password: 12345678)
end
30.times do |n|
  Post.create!(
    user_id: n/2 +1,
    description: FFaker::Lorem.paragraph)
end

