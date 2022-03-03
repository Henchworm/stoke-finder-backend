require 'rails_helper'

RSpec.describe "create an adventure request" do
  describe 'shows an adventure' do
    it 'happy path' do
      user = FactoryBot.create(:user)
      adventure = Adventure.create!(user_id: user.id,
                                    rec_area_id: 1,
                                    activities: "Hiking, Fishing, Boating",
                                    comment: "cool rocks",
                                    favorite: true,
                                    date: DateTime.current
                                  )

      headers = { "CONTENT_TYPE" => "application/json" }
      post "/api/v1/adventures", headers: headers, params: adventure_params, as: :json

      get "/api/v1/adventures/#{Adventure.last.id}"

      adventure = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(adventure).to be_a(Hash)

      adventure_data = adventure[:data]

      expect(adventure[:attributes]).to have_key(:rec_area_id)
      expect(adventure[:attributes][:rec_area_id]).to be_an(Integer)

      expect(adventure[:attributes]).to have_key(:guest_email_addresses)
      expect(adventure[:attributes][:guest_email_addresses]).to be_an(String)

      expect(adventure[:attributes]).to have_key(:activities)
      expect(adventure[:attributes][:activities]).to be_an(String)

      expect(adventure[:attributes]).to have_key(:comment)
      expect(adventure[:attributes][:comment]).to be_an(String)

      expect(adventure[:attributes]).to have_key(:favorite)
      expect(adventure[:attributes][:favorite]).to be_an(Boolean)
    end
  end
end
