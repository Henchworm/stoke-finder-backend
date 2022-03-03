require 'rails_helper'

RSpec.describe 'login endpoint' do
  context 'happy path' do
    it 'returns user data if given correct credentials', :vcr do
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
      user = User.create!(user_params)

      user_data = {user_name: "BobBarker123", password: "Guest"}

      headers = { "CONTENT_TYPE" => "application/json" }
      post "/api/v1/sessions", headers: headers, params: user_data, as: :json

      incoming = JSON.parse(response.body, symbolize_names: true)

      expect(response.status).to eq(200)

      expect(incoming).to be_a(Hash)
      expect(incoming).to have_key(:data)
      expect(incoming[:data]).to be_a(Hash)

      data = incoming[:data]

      expect(data).to have_key(:attributes)
      expect(data[:attributes]).to be_a(Hash)

      attributes = data[:attributes]

      expect(attributes).to have_key(:user_name)
      expect(attributes[:user_name]).to eq("BobBarker123")
      expect(attributes).to have_key(:email)
      expect(attributes[:email]).to eq("bobby@faker.net")
      expect(attributes).to have_key(:street_address)
      expect(attributes[:street_address]).to eq("2484 Houstoun Waring Cir")
      expect(attributes).to have_key(:city)
      expect(attributes[:city]).to eq("Littleton")
      expect(attributes).to have_key(:state)
      expect(attributes[:state]).to eq("CO")
      expect(attributes).to have_key(:zipcode)
      expect(attributes[:zipcode]).to eq("80120")
      expect(attributes).to have_key(:activity_preferences)
      expect(attributes[:activity_preferences]).to be_a(String)
    end
  end

  context 'sad path' do
    it 'returns errors if given incorrect credentials', :vcr do
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
      user = User.create!(user_params)

      user_data = {user_name: "BobBarker123", password: "Banana"}

      headers = { "CONTENT_TYPE" => "application/json" }
      post "/api/v1/sessions", headers: headers, params: user_data, as: :json

      incoming = JSON.parse(response.body, symbolize_names: true)
      
      expect(response.status).to eq(400)

      expect(incoming).to be_a(Hash)
      expect(incoming).to have_key(:status)
      expect(incoming[:status]).to eq("ERROR")
      expect(incoming).to have_key(:message)
      expect(incoming[:message]).to eq("Invalid username or password")
      expect(incoming).to have_key(:data)
      expect(incoming[:data]).to eq({})
    end
  end
end
