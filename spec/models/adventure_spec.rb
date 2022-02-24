require 'rails_helper'

RSpec.describe Adventure, type: :model do
  describe 'validations' do 
    it { should validate_presence_of(:guest_email_address) }
    it { should validate_presence_of(:date) }
    it { should validate_presence_of(:comment) }
    it { should validate_presence_of(:activity) }
    it { should validate_presence_of(:favorite) }
    # it { should validate_presence_of(:rec_area_id) }
    # it { should validate_presence_of(:custom_rec_areas_id) }
  end

  describe 'relationships' do 
    it { should have_many(:user_adventures) }
    it { should have_many(:users).through(:user_adventures) }
  end
end