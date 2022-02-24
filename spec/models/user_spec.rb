require 'rails_helper'
RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of :user_name }
    it { should validate_uniqueness_of :email }
    it { should validate_presence_of :password }
    it { should validate_uniqueness_of :email }
    it { should validate_presence_of :password_digest }
    it { should have_secure_password }
    it { should validate_presence_of :access }
    it { should validate_presence_of :street_address }
    it { should validate_presence_of :city }
    it { should validate_presence_of :state }
    it { should validate_presence_of :zipcode }
    it { should validate_presence_of :activity_preferences }
  end

  describe "creation" do
    it "user attributes" do
      user_1 = FactoryBot.create(:user)
      expect(user_1.user_name).to be_a(String)
      expect(user_1.email).to be_a(String)
      expect(user_1.password).to be_a(String)
      expect(user_1.access).to eq("user")
      expect(user_1.street_address).to be_a(String)
      expect(user_1.city).to be_a(String)
      expect(user_1.state).to be_a(String)
      expect(user_1.zipcode).to be_a(String)
      expect(user_1.activity_preferences).to be_a(String)
    end
  end
end