require 'rails_helper'

RSpec.describe 'user requests' do
  it 'renders user to json' do 
    user = FactoryBot.create(:user)

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