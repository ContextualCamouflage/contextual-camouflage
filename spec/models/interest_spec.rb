require 'rails_helper'

RSpec.describe Interest, type: :model do
  it "should have valid factory" do
    expect(FactoryBot.build(:interest)).to be_valid
  end

end