require 'rails_helper'

RSpec.describe Submission, type: :model do
  
  before(:each) do
    illness = FactoryGirl.create(:illness)
    installation = FactoryGirl.create(:installation, locality: "Sewickley")
    @submission = FactoryGirl.create(:submission, illness_id: illness.id, locality: installation.locality)
  end

  it { is_expected.to have_many(:researches) }
  it { is_expected.to have_many(:anecdotes) }
  it { validate_presence_of :illness_id }

  describe 'active_installation' do
    it 'is active' do
      expect(@submission.send(:active_installation)).to be_nil
    end  
  end

end
