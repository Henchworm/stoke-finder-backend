require 'rails_helper'
RSpec.describe User, type: :model do
  describe 'validations' do
    let(:user)  { build :user }
    describe '#user_name' do
      it { should validate_presence_of(:user_name) }
      it { should_not allow_value(nil).for(:user_name) }
    end

    describe '#email' do
      it { should validate_presence_of(:email) }
      it { should_not allow_value(nil).for(:email) }
      it { should validate_uniqueness_of(:email) }
    end

    describe '#password' do
      it { should validate_presence_of(:password_digest)}
      it 'tests a new user creation' do
        expect(user).to_not have_attribute(:password)
        expect(user.password_digest).to_not eq('password123')
      end
      it { should have_secure_password }
    end

    describe '#access' do
      it { should validate_presence_of(:access) }
      it { should_not allow_value(nil).for(:access) }
    end

    describe '#street_address' do
      it { should validate_presence_of(:street_address) }
      it { should_not allow_value(nil).for(:street_address) }
    end

    describe '#city' do
      it { should validate_presence_of(:city) }
      it { should_not allow_value(nil).for(:city) }
    end

    describe '#state' do
      it { should validate_presence_of(:state) }
      it { should_not allow_value(nil).for(:state) }
    end

    describe '#zipcode' do
      it { should validate_presence_of(:zipcode) }
      it { should_not allow_value(nil).for(:zipcode) }
    end

    describe '#activity_preferences' do
      it { should validate_presence_of(:activity_preferences) }
      it { should_not allow_value(nil).for(:activity_preferences) }
    end
  end

  describe "relationships" do
    it { should have_many :user_adventures }
    # it { should have_many :custom_rec_areas }
    it { should have_many(:adventures).through(:user_adventures) }
  end

  describe "creation" do
    it "user attributes", :vcr do
      user_1 = FactoryBot.create(:user, street_address: "19072 Ave 300", city: "Exeter", state: "California", zipcode: "93221")
      user_1.add_coordinates
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
    it 'assigns coords to user', :vcr do
      user_1.add_coordinates
      expect(user_1.latitude).to eq(36.268349507128)
      expect(user_1.longitude).to eq(-119.15010250939521)
    end
  end
end
