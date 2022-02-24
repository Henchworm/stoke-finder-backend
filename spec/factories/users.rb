FactoryBot.define do
  factory :user do
    user_name {Faker::DcComics.name}
    email {Faker::DcComics.name}
    password {Faker::DcComics.name}
    access {0}
    street_address {Faker::Address.street_address}
    city {Faker::Address.city}
    state {Faker::Address.state}
    zipcode {Faker::Address.zip}
    activity_preferences {"Hiking, Fishing, Boating"}
  end
end