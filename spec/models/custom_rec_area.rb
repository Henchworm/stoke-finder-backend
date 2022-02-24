require 'rails_helper'

RSpec.describe CustomRecArea, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:longitude) }
    it { should validate_presence_of(:latitude) }
    it { should validate_presence_of(:activities) }
    it { should validate_presence_of(:comments) }
  end

  describe 'relationships' do
    it { should belong_to(:user) }
  end

  describe "creation" do
    it "creates a custom_rec_area" do
      custom_rec_area_1 = FactoryBot.create(:custom_rec_area)
      expect(custom_rec_area_1.name).to be_a(String)
      expect(custom_rec_area_1.longitude).to be_a(String)
      expect(custom_rec_area_1.latitude).to be_a(String)
      expect(custom_rec_area_1.activities).to be_a(String)
      expect(custom_rec_area_1.comments).to be_a(String)
      expect(custom_rec_area_1.user_id).to be_an(Integer)
    end 
  end
end