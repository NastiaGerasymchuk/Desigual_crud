# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Category.destroy_all
# Gender.destroy_all
# Nominal.destroy_all
# Trend.destroy_all
# Clother.destroy_all
#
# 100.times do
#   Category.create(
#     name: Faker::Name.unique.name
#   )
#
# end
# 100.times do
#   Gender.create(
#     name: Faker::Name.unique.name
#   )
# end
# 100.times do
#   Nominal.create(
#     name: Faker::Name.unique.initials(number: 2)
#   )
# end
# 100.times do
#   Trend.create(
#     name: Faker::Name.unique.name
#   )
# end

# 100.times do
#   Clother.create(
#     description: Faker::Name.unique.name,
#     price: Faker::Config.random,
#     image: File.open(Rails.root.join('db/math.jpg')),
#     # image: Faker::LoremFlickr.image(size: "50x60", match_all: true),
#     trend_id: rand(16...80),
#     nominal_id: rand(2...20),
#     gender_id: rand(8...45),
#     category_id: rand(130...140)
#   )
# end
# 50.times do
#   description= Faker::Name.unique.name
#   price= Faker::Config.random
#   trend_id= rand(1914...1920)
#   nominal_id= rand(2009...2015)
#   gender_id= rand(2020...2025)
#   category_id=rand(2224...2028)
#   image = File.open(Rails.root.join('db/math.jpg'))
#
#     # user.microposts.create!(content: content, image: image)
#   image.rewind # rewinding a file takes the cursor back to the initial position, which is required to read the whole file
#   clother = Clother.new(description: description,price: price, trend_id:trend_id,
#                         nominal_id:nominal_id, gender_id:gender_id, category_id:category_id)
#   clother.image.attach(
#     io: image,
#     filename: '_placeholder.png',
#     content_type: 'image/png'
#   )
#   clother.save!
#
# end
# 
100.times do
  clother = Clother.create(description: Faker::Name.unique.name,
                           price: Faker::Config.random,)
  if clother.persisted?
    rand(1..10).times do
      clother.category.create(
        name: Faker::Name.name
      )
      clother.gender.create(
        name: Faker::Name.name
      )
      clother.nominal.create(
        name: Faker::Name.name
      )
      clother.trend.create(
        name: Faker::Name.name
      )
      clother.image.attach(
        io: image,
        filename: '_placeholder.png',
        content_type: 'image/png'
          )
      clother.save!     
    end
  end
  puts clother.inspect
end