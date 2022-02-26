require 'rails_helper'
RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of :user_name }
    it { should validate_uniqueness_of :email }
    it { should validate_presence_of :password }
    it { should validate_presence_of :password_digest }
    it { should have_secure_password }
    it { should validate_presence_of :access }
    it { should validate_presence_of :street_address }
    it { should validate_presence_of :city }
    it { should validate_presence_of :state }
    it { should validate_presence_of :zipcode }
    it { should validate_presence_of :activity_preferences }
  end

  describe "relationships" do
    it { should have_many :user_adventures }
    it { should have_many :custom_rec_areas }
    it { should have_many(:adventures).through(:user_adventures) }
  end

  describe "creation" do
    it "user attributes", :vcr do
      user_1 = FactoryBot.create(:user, street_address: "936 Akin. Ave", city: "Fort Collins", state: "Colorado", zipcode: "80521")
      
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

  describe 'instance methods' do 
    let(:user_1) {FactoryBot.create(:user, street_address: "19072 Ave 300", city: "Exeter", state: "California", zipcode: "93221")}

    it 'concats assigns coordinates to user after creation', :vcr do 
      expect(user_1.latitude).to eq(36.268349507128)
      expect(user_1.longitude).to eq(-119.15010250939521)
    end
  end
end