# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(
    email: "din14@gmail.com",
    password: "password",
    password_confirmation: "password"
  )

25.times do |i|
        activity = Activity.new
        activity.title = Faker::Lorem.sentence(word_count: 3, random_words_to_add: 7)
        activity.max_attendees = Faker::Number.between(from: 1, to: 50)
        activity.owner = Faker::Name.name
        activity.ticket_price = Faker::Number.between(from: 1, to: 200)
        activity.description = Faker::Lorem.paragraph_by_chars(number: 1000)
        activity.date = Faker::Date.forward(days: 23)
        activity.thumbnail.attach(io: open("https://picsum.photos/1920/1080"), filename: "#{i}_thumbnail.jpg")
        activity.save!
    end
