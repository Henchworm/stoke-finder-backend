require 'rails_helper'
RSpec.describe "welcome request" do
  it "gets welcome request" do
    get api_v1_root_path
    expect(request.env).to be_a(Hash)
  end
end