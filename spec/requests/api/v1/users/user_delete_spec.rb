require 'rails_helper'
RSpec.describe "user delete" do
  it "deletes a user", :vcr do
    user_1 = User.create!(
      id: 99999,
      user_name: "BobBarker123",
      email: "email@parker.net",
      password: "Guest",
      password_confirmation: "Guest",
      access: 0,
      street_address: "2484 Houstoun Waring Cir",
      city: "Littleton",
      state: "CO",
      zipcode: "80120",
      activity_preferences: ["HIKING", "BIKING", "CAMPING"]
      )
      headers = { "CONTENT_TYPE" => "application/json" }

      delete  "/api/v1/users/#{user_1.id}"
      expect(response).to be_successful
      parsed = JSON.parse(response.body, symbolize_names: true)
      expect(parsed[:message]).to eq('Account successfully deleted.')
  end
end