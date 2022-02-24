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
end