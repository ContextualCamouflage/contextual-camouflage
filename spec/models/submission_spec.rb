require 'rails_helper'

RSpec.describe Submission, type: :model do
  
  before(:each) do
    illness = FactoryBot.create(:illness)
    installation = FactoryBot.create(:installation, locality: "Sewickley")
    @submission = FactoryBot.create(:submission, illness_id: illness.id, locality: installation.locality)
  end

  it { is_expected.to have_many(:researches) }
  it { is_expected.to have_many(:anecdotes) }

  describe 'active_installation' do
    it 'is active' do
      expect(@submission.send(:active_installation)).to be_nil
    end  
  end

end
