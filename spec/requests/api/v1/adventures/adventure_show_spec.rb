require 'rails_helper'

RSpec.describe "Show an adventure request" do
  describe 'shows an adventure' do
    it 'happy path' do
      user = FactoryBot.create(:user)
      adventure = Adventure.create!(
            rec_area_id: 1,
            guest_email_addresses: "bob@google.com, john@reddit.com",
            activities: "Hiking, Fishing, Boating",
            comment: "cool rocks",
            favorite: true,
            date: DateTime.current
          )

      adventure_params = {
      user_id: user.id,
          #user id from session
      rec_area_id: 1,
      guest_email_addresses: "bob@google.com, john@reddit.com",
      activities: "Hiking, Fishing, Boating",
      comment: "cool rocks",
      favorite: true,
      date: DateTime.current
      }

      headers = { "CONTENT_TYPE" => "application/json" }
      post "/api/v1/adventures", headers: headers, params: adventure_params, as: :json

      get "/api/v1/adventures/#{Adventure.last.id}"

      adventure = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(adventure).to be_a(Hash)

      adventure_data = adventure[:data]

      expect(adventure_data[:attributes]).to have_key(:guest_email_addresses)
      expect(adventure_data[:attributes][:guest_email_addresses]).to be_an(String)

      expect(adventure_data[:attributes]).to have_key(:activities)
      expect(adventure_data[:attributes][:activities]).to be_an(String)

      expect(adventure_data[:attributes]).to have_key(:comment)
      expect(adventure_data[:attributes][:comment]).to be_an(String)

      expect(adventure_data[:attributes]).to have_key(:favorite)
      expect(adventure_data[:attributes][:favorite]).to eq(true)
    end
  end
end
