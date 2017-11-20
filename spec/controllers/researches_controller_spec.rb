require 'rails_helper'

RSpec.describe ResearchesController, type: :controller do

  before do
    FactoryGirl.create(:installation)
    illness = FactoryGirl.create(:illness)
    @submission = FactoryGirl.create(:submission, illness_id: illness.id)
  end

  describe '#create' do
    it 'works' do
      @request.cookies['cc'] = @submission.cookie
      post :create, params: {research: {body: "Here is a body!", age: "50", gender: "Female", occupation: "Central Hospitality Technician", race: "American Indian or Alaska Native", submission_id: @submission.id}}
      expect(assigns(:research)).to eq Research.last
    end
  end

end
