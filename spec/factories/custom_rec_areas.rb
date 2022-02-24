FactoryBot.define do
  factory :custom_rec_area do
    association :user, factory: :user
    name {Faker::Mountain.name}
    longitude {Faker::Address.longitude}
    latitude {Faker::Address.latitude}
    activities {"Tubing"}
    comments {"Big squirrels."}
  end
end
