require 'rails_helper'
RSpec.describe UserAdventure, type: :model do
  it { should belong_to :user }
  it { should belong_to :adventure }
end