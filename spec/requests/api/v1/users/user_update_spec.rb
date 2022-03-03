require 'rails_helper'
RSpec.describe "updating a user" do
  it "updates a user", :vcr do
    user_1 = User.create!(
      id: 7777777,
      user_name: "BobBarker123",
      email: "email@goblin.net",
      password: "Guest",
      password_confirmation: "Guest",
      access: 0,
      street_address: "2484 Houstoun Waring Cir",
      city: "Littleton",
      state: "CO",
      zipcode: "80120",
      activity_preferences: ["HIKING", "BIKING", "CAMPING"]
      )
    new_user_params =  {
    id: "7777777",
    user_name: "Hobgoblin34",
    email: "email@goblin.net",
    password: "Guest",
    password_confirmation: "Guest",
    access: 0,
    street_address: "2484 Houstoun Waring Cir",
    city: "Littleton",
    state: "CO",
    zipcode: "80120",
    activity_preferences: "HIKING, BIKING, CAMPING"
    }
    headers = { "CONTENT_TYPE" => "application/json" }

    patch "/api/v1/users/#{user_1.id}", headers: headers, params: new_user_params, as: :json
    expect(response).to be_successful
    expect(User.last[:user_name]).to eq("Hobgoblin34")
  end

end