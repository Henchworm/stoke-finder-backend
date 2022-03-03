require 'rails_helper'

RSpec.describe Adventure, type: :model do
  describe 'validations' do
    describe '#guest_email_addresses' do
      it { should validate_presence_of :guest_email_addresses }
      it { should_not allow_value(nil).for(:guest_email_addresses) }
    end

    describe '#date' do
      it { should validate_presence_of :date }
      it { should_not allow_value(nil).for(:date) }
      it { should_not allow_value("abcd").for(:date) }
      it { should_not allow_value("5").for(:date) }
    end

    describe '#comment' do
      it { should validate_presence_of :comment }
      it { should_not allow_value(nil).for(:comment) }
      it { should allow_value("abcd").for(:comment) }
      it { should allow_value("5").for(:comment) }
    end

    describe '#activities' do
      it { should validate_presence_of :activities }
      it { should_not allow_value(nil).for(:activities) }
      it { should allow_value("abcd").for(:activities) }
      it { should allow_value("5").for(:activities) }
    end

    describe '#favorite' do
      it { should validate_presence_of :favorite }
      it { should_not allow_value(nil).for(:favorite) }
      it { should allow_value("abcd").for(:favorite) }
      it { should allow_value("5").for(:favorite) }
    end

    describe '#rec_area_id' do
      it { should validate_presence_of :rec_area_id }
      it { should_not allow_value(nil).for(:rec_area_id) }
      it { should allow_value("abcd").for(:rec_area_id) }
      it { should allow_value("5").for(:rec_area_id) }
    end
  end

  describe 'relationships' do
    it { should have_many(:user_adventures) }
    it { should have_many(:users).through(:user_adventures) }
  end

  describe "creation" do
    it "creates adventure", :vcr do

      adventure_1 = Adventure.create!(
      rec_area_id: 1,
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
