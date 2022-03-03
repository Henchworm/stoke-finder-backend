require 'rails_helper'

RSpec.describe 'Oauth user verification' do
  context 'registering' do
    it 'returns a clear status if an oauth email does not exist in the db' do
      VCR.use_cassette('oauth-register-path') do
        user_params =  {
        email: "jackjohnson@faker.net",
        }

        headers = { "CONTENT_TYPE" => "application/json" }
        post "/api/v1/sessions/auth", headers: headers, params: user_params, as: :json

        incoming = JSON.parse(response.body, symbolize_names: true)

        expect(response.status).to eq(200)

        expect(incoming).to be_a(Hash)
        expect(incoming).to have_key(:status)
        expect(incoming[:status]).to eq("OK")
        expect(incoming).to have_key(:message)
        expect(incoming[:message]).to eq("CLEAR")
        expect(incoming).to have_key(:data)
        expect(incoming[:data]).to eq({})
      end
    end
  end

  context 'logging in' do
    it 'logs an oauth user in if they exist' do
      VCR.use_cassette('oauth-login-path') do
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

        user_data = {email: "bobby@faker.net" }

        headers = { "CONTENT_TYPE" => "application/json" }
        post "/api/v1/sessions/auth", headers: headers, params: user_params, as: :json

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
  end
end
