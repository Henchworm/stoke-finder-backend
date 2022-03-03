require 'rails_helper'

RSpec.describe CustomRecArea, type: :model do
  describe 'validations' do
    let(:custom_rec_area)  { build :custom_rec_area }

    describe '#name' do
      it { should validate_presence_of :name }
      it { should_not allow_value(nil).for(:name) }
    end

    describe '#longitude' do
      it { should validate_presence_of :longitude }
      it { should_not allow_value(nil).for(:longitude) }
      it { should_not allow_value("abcd").for(:longitude) }
      it { should allow_value("5").for(:longitude) }
    end

    describe '#latitude' do
      it { should validate_presence_of :latitude }
      it { should_not allow_value(nil).for(:latitude) }
      it { should_not allow_value("abcd").for(:latitude) }
      it { should allow_value("5").for(:latitude) }
    end

    describe '#activities' do
      it { should validate_presence_of :activities }
      it { should_not allow_value(nil).for(:activities) }
    end

    describe '#comments' do
      it { should validate_presence_of :comments }
      it { should_not allow_value(nil).for(:comments) }
    end
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
