# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#
admin = Admin.create! email: "admin@gmail.com", password: "123456"

Faker::Config.locale = "vi"
50.times do |n|
  user = User.new
  user.name = Faker::Games::LeagueOfLegends.champion
  user.address = Faker::Address.full_address
  user.birthday = Faker::Date.birthday(min_age: 18, max_age: 65) #=> "Mar, 28 Mar 1986"
  user.picture = Faker::Avatar.image(slug: "my-own-slug", size: "50x50", format: "jpg") #=> "https://robohash.org/my-own-slug.jpg?size=50x50&set=set1"
  prng = Random.new
  user.gender = prng.rand(1)
  user.phone = Faker::PhoneNumber.phone_number_with_country_code
  user.email = "example-#{n+1}@gmail.com"
  user.password = "123456"
  user.save!
end
