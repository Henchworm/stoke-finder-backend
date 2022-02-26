# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user_1 = User.create!(user_name: "Borton Preekers",
                      email:"borton@gmail.com",
                      street_address: "123 Lane",
                      access: 0,
                      password: "zelma420",
                      city: "Denver",
                      state: "CO",
                      zipcode:"80211",
                      activity_preferences: "Biking")
