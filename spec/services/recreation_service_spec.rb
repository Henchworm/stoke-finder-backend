require 'rails_helper'

RSpec.describe RecreationService do
  it 'can search for a rec area by multiple parameters' do
     VCR.use_cassette('rec_areas_search') do
      activities = "HIKING BIKING"
      user = create(:user, street_address: "1634 18th St", city: "Denver", state: "CO", zipcode: "80202", activity_preferences: activities)

      user.add_coordinates

      latitude = user.latitude
      longitude = user.longitude
      radius = 10
      activities = [user.activity_preferences]

      expect(RecreationService.get_rec_area(latitude,longitude,radius,activities)).to be_a(Hash)
      expect(RecreationService.get_rec_area(latitude,longitude,radius,activities)[:RECDATA]).to be_an(Array)
      expect(RecreationService.get_rec_area(latitude,longitude,radius,activities)[:RECDATA][0]).to be_a(Hash)

      rec_data = RecreationService.get_rec_area(latitude,longitude,radius,activities)[:RECDATA][0]

      expect(rec_data).to have_key(:RecAreaID)
      expect(rec_data[:RecAreaID]).to be_a(String)
      expect(rec_data).to have_key(:RecAreaName)
      expect(rec_data[:RecAreaName]).to be_a(String)
      expect(rec_data).to have_key(:RecAreaDescription)
      expect(rec_data[:RecAreaDescription]).to be_a(String)
      expect(rec_data).to have_key(:RECAREAADDRESS)
      expect(rec_data[:RECAREAADDRESS][0]).to be_a(Hash)
      expect(rec_data).to have_key(:RecAreaDirections)
      expect(rec_data[:RecAreaDirections]).to be_a(String)
      expect(rec_data).to have_key(:RecAreaPhone)
      expect(rec_data[:RecAreaPhone]).to be_a(String)
      expect(rec_data).to have_key(:Reservable)
      #expect(rec_data[:Reservable]).to be_a(String)
      expect(rec_data).to have_key(:ACTIVITY)
      expect(rec_data[:ACTIVITY][0]).to be_a(Hash)
      expect(rec_data).to have_key(:RecAreaLongitude)
      expect(rec_data[:RecAreaLongitude]).to be_a(Float)
      expect(rec_data).to have_key(:RecAreaLatitude)
      expect(rec_data[:RecAreaLatitude]).to be_a(Float)
      expect(rec_data).to have_key(:MEDIA)
      expect(rec_data[:MEDIA]).to be_an(Array)
      expect(rec_data).to have_key(:LINK)
      expect(rec_data[:LINK]).to be_a(Array)
    end
  end
end
