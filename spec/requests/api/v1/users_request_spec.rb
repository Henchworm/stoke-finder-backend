require 'rails_helper'

RSpec.describe 'user requests' do
  it 'renders user to json', :vcr do 
    user = FactoryBot.create(:user, street_address: "19072 Ave 300", city: "Exeter", state: "California", zipcode: "93221")

    get api_v1_user_path(user)
    
    parsed = JSON.parse(response.body , symbolize_names: true)[:data]
    
    expect(response).to be_successful
    
    expect(parsed[:id]).to be_a(String)
    expect(parsed[:attributes][:user_name]).to be_a(String)
    expect(parsed[:attributes][:email]).to be_a(String)
    expect(parsed[:attributes][:street_address]).to be_a(String)
    expect(parsed[:attributes][:city]).to be_a(String)
    expect(parsed[:attributes][:state]).to be_a(String)
    expect(parsed[:attributes][:zipcode]).to be_a(String)
    expect(parsed[:attributes][:activity_preferences]).to be_a(String)
  end
end