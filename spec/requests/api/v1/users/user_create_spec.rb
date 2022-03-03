require 'rails_helper'

RSpec.describe 'Creating a user' do
  context 'non-OAuth user' do
    it 'happy path: creates a user when given correct data', :vcr do
      user_params =  {
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
      }
      headers = { "CONTENT_TYPE" => "application/json" }

      post "/api/v1/users", headers: headers, params: user_params, as: :json
      expect(response).to be_successful
      expect(User.last[:user_name]).to eq("BobBarker123")
    end

    it 'sad path: fields left blank', :vcr do
      user_params =  {
      email: "email@faker.net",
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

      expect(response).to_not be_successful

      return_value = JSON.parse(response.body, symbolize_names: true)
      expect(return_value[:message]).to eq("User name can't be blank")
    end

    it 'edge case: all fields left blank', :vcr do
      user_params =  {}
      headers = { "CONTENT_TYPE" => "application/json" }

      post "/api/v1/users", headers: headers, params: user_params, as: :json

      return_value = JSON.parse(response.body, symbolize_names: true)

      expect(response).to_not be_successful
      expect(return_value[:message]).to eq("User name can't be blank, Email is invalid, Email can't be blank, Password digest can't be blank, Access can't be blank, Street address can't be blank, City can't be blank, State can't be blank, Zipcode can't be blank, Activity preferences can't be blank, and Password can't be blank")
    end

    it "edge case: activity_preferences passed as string", :vcr do
      user_params =  {
      user_name: "BobBarker123",
      email: "email@faker.net",
      password: "Guest",
      password_confirmation: "Guest",
      access: 0,
      street_address: "2484 Houstoun Waring Cir",
      city: "Littleton",
      state: "CO",
      zipcode: "80120",
      activity_preferences: "HIKING BIKING CAMPING"
      }

      headers = { "CONTENT_TYPE" => "application/json" }

      post "/api/v1/users", headers: headers, params: user_params, as: :json

      expect(response).to be_successful
      expect(response.status).to eq(201)

    end
  end
end
