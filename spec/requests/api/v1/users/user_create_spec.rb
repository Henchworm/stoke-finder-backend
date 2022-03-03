require 'rails_helper'

RSpec.describe 'Creating a user' do
  context 'non-OAuth user' do
    context 'happy path' do
      it 'creates a user when given correct data', :vcr do

        user_params =  {
        user_name: "BobBarker123",
        email: "bobby@faker.net",
        password: "Guest",
        password_confirmation: "Guest",
        access: 0,
        street_address: "2484 Houstoun Waring Cir",
        city: "Littleton",
        state: "CO",
        zipcode: "80120",
        activity_preferences: ["HIKING", "BIKING", "CAMPING"]
        }
        headers = { "CONTENT_TYPE" => "application/json" }


        post "/api/v1/users", headers: headers, params: user_params, as: :json
        expect(response).to be_successful
        expect(User.last[:user_name]).to eq("BobBarker123")

      end
    end
  end
end
