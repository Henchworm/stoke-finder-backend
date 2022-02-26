require 'rails_helper'

RSpec.describe Adventure, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:guest_email_addresses) }
    it { should validate_presence_of(:date) }
    it { should validate_presence_of(:comment) }
    it { should validate_presence_of(:activities) }
    it { should validate_presence_of(:favorite) }
    it { should validate_presence_of(:rec_area_id) }
  end

  describe 'relationships' do
    it { should have_many(:user_adventures) }
    it { should have_many(:users).through(:user_adventures) }
  end

  describe "creation" do
    it "creates adventure", :vcr do
      custom_rec_area_1 = FactoryBot.create(:custom_rec_area)
      adventure_1 = Adventure.create(
      rec_area_id: custom_rec_area_1.id,
      guest_email_addresses: "bob@google.com, john@reddit.com",
      activities: "Hiking, Fishing, Boating",
      comment: "cool rocks",
      favorite: true,
      date: DateTime.current
      )
      expect(adventure_1.guest_email_addresses).to be_a(String)
      expect(adventure_1.date).to be_a(ActiveSupport::TimeWithZone)
      expect(adventure_1.comment).to be_a(String)
      expect(adventure_1.activities).to be_a(String)
      expect(adventure_1.favorite).to eq(true)
    end
  end
end