require 'rails_helper'

RSpec.describe RecreationService do
  it 'can search for a rec area by multiple parameters' do
     VCR.use_cassette('rec_areas_search') do
      user = create(:user)

      latitude = user.latitude
      longitude = user.longitude
      radius = 10
      #default =
      # lat = 39.8916537
      # long =  -105.7630624
      # activity = "Hiking"
      # activities = ["Hiking", "Biking", ""]
      #keyword or activity ID

      expect(RecreationService.get_rec_area(state, radius)).to be_a(Hash)
      expect(RecreationService.get_rec_area(state, radius)[:RECDATA]).to be_an(Array)
      expect(RecreationService.get_rec_area(state, radius)[:RECDATA][0]).to be_a(Hash)

      rec_data = RecreationService.get_rec_area(state, radius)[:RECDATA][0]

      expect(rec_data).to have_key(:RecAreaID)
      expect(rec_data[:RecAreaID]).to be_a(String)
      expect(rec_data).to have_key(:RecAreaName)
      expect(rec_data)[:RecAreaName]).to be_a(String)
      # expect(rec_data).to have_key(:RecAreaDescription)
      # expect(rec_data)[:RecAreaDescription].to be_a(String)
      # expect((rec_data).to have_key(:RECAREAADDRESS)
      # expect(rec_data)[:RECAREAADDRESS][0].to be_a(Hash)
      #             #need to build out keys for address????
      # expect(rec_data).to have_key(:RecAreaDirections)
      # expect(rec_data)[:RecAreaDirections].to be_a(String)
      # expect(rec_data).to have_key(:RecAreaPhone)
      # expect(rec_data)[:RecAreaPhone].to be_a(String)
      # expect(rec_data).to have_key(:RecAreaEmail)
      # expect(rec_data)[:RecAreaEmail].to be_a(String)
      # expect(rec_data).to have_key(:Reservable)
      # expect(rec_data)[:Reservable].to be_a(Boolean)
      # expect(rec_data).to have_key(ACTIVITY)
      # expect(rec_data)[ACTIVITY][0].to be_a(Hash)
          #need to build out activity data
          #coorinates??? key "GEOJSON" => Hash OR
          #"RecAreaLongitude" => float
          #"RecAreaLatitude" => float
          # key "LINK"
          # key "MEDIA"
    end
  end
end
