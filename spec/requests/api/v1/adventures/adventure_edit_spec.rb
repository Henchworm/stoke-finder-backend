require 'rails_helper'
RSpec.describe "edit an existing adventure" do

  it "updates existing adventure happy path" do
     adventure_1 = Adventure.create!(
      rec_area_id: 1,
      guest_email_addresses: "bob@google.com, john@reddit.com",
      activities: "Hiking, Fishing, Boating",
      comment: "cool rocks",
      favorite: true,
      date: DateTime.current
    )
    adventure_params = {
    id: adventure_1.id,
    rec_area_id: 1,
    guest_email_addresses: "bob@google.com, john@reddit.com, billy@turing.edu",
    activities: "Hiking, Fishing, Eating",
    comment: "cool rocks",
    favorite: true,
    date: DateTime.current
    }

    headers = { "CONTENT_TYPE" => "application/json" }
    patch "/api/v1/adventures/#{adventure_1.id}", headers: headers, params: adventure_params, as: :json

    expect(response).to be_successful
    parsed = JSON.parse(response.body, symbolize_names: true)
    expect(parsed).to be_a(Hash)
    expect(parsed[:data][:attributes][:guest_email_addresses]).to eq("bob@google.com, john@reddit.com, billy@turing.edu")
  end
  #
  it "updates existing user sad path incomplete attributes" do
    #dunno if this test is necessary cuz everything is string, but can't hurt. Breaking datetime here
    #which will be impossible due to nature of the form.

    adventure_1 = Adventure.create!(
     rec_area_id: 1,
     guest_email_addresses: "bob@google.com, john@reddit.com",
     activities: "Hiking, Fishing, Boating",
     comment: "cool rocks",
     favorite: true,
     date: DateTime.current
   )
   adventure_params = {
   id: adventure_1.id,
   rec_area_id: 1,
   activities: "Hiking, Fishing, Eating",
   comment: "cool rocks",
   favorite: 11010101,
   date: 1111
   }

   headers = { "CONTENT_TYPE" => "application/json" }
   patch "/api/v1/adventures/#{adventure_1.id}", headers: headers, params: adventure_params, as: :json
   expect(response).to_not be_successful

   parsed = JSON.parse(response.body, symbolize_names: true)
   expect(parsed).to be_a(Hash)
   expect(parsed[:status]).to eq("ERROR")
  end
end

