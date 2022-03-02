require 'rails_helper'
RSpec.describe "updating a user" do
  describe 'updates a user' do
    before(:each) do
      @user_1 = User.create!(
        id: 7777777,
        user_name: "BobBarker123",
        email: "email@goblin.net",
        password: "Guest",
        password_confirmation: "Guest",
        access: 0,
        street_address: "2484 Houstoun Waring Cir",
        city: "Littleton",
        state: "CO",
        zipcode: "80120",
        activity_preferences: ["HIKING", "BIKING", "CAMPING"]
        )
    end

    it "happy_path", :vcr do
      new_user_params =  {
      id: 7777777,
      user_name: "Hobgoblin34",
      email: "email@goblin.net",
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


      patch "/api/v1/users/#{@user_1.id}", headers: headers, params: new_user_params, as: :json
      expect(response).to be_successful
      expect(User.last[:user_name]).to eq("Hobgoblin34")
    end

    it "sad path: field left blank", :vcr do
      new_user_params =  {
      id: 7777777,
      user_name: "",
      email: "email@goblin.net",
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


      patch "/api/v1/users/#{@user_1.id}", headers: headers, params: new_user_params, as: :json
      expect(response).to_not be_successful
      expect(response.status).to eq(400)
    end

    it "sad path: invalid email", :vcr do
      new_user_params =  {
      id: 7777777,
      user_name: "",
      email: "goblin_net",
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


      patch "/api/v1/users/#{@user_1.id}", headers: headers, params: new_user_params, as: :json
      expect(response).to_not be_successful
      expect(response.status).to eq(400)
    end

    it "edge case: Invalid user id", :vcr do
      non_user_id = 100000000000000
      new_user_params = create(:user, password: "Guest", password_confirmation: "Guest",)

      headers = { "CONTENT_TYPE" => "application/json" }
      patch "/api/v1/users/#{non_user_id}", headers: headers, params: new_user_params, as: :json
      expect(response).to_not be_successful
      expect(response.status).to eq(400)
    end
  end
end
