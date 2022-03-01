require 'rails_helper'

RSpec.describe 'Creating a user' do
  context 'non-OAuth user' do
    context 'happy path' do
      it 'creates a user when given correct data', :vcr do

        user_params =({
        user_name: "BobBarker123",
        email: "email@faker.net",
        password: "Guest",
        password_confirmation: "Guest",
        access: 0,
        street_address: "2484 Houstoun Waring Cir",
        city: "Littleton",
        state: "CO",
        zipcode: "80120",
        activity_preferences: ["HIKING", "BIKING", "CAMPING"]
        })

        headers = {"CONTENT_TYPE" => "application/json"}

        post api_v1_users_path, headers: headers, params: JSON.generate(user: user_params)
      end
    end
  end
end
