require 'rails_helper'

RSpec.describe Interest, type: :model do
  it "should have valid factory" do
    FactoryBot.build(:interest).should be_valid
  end

end