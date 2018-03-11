require 'rails_helper'

RSpec.describe ResearchesController, type: :controller do

  before do
    FactoryBot.create(:installation)
    illness = FactoryBot.create(:illness)
    @submission = FactoryBot.create(:submission, illness_id: illness.id)
  end

  describe '#create' do
    it 'works' do
      @request.session['id'] = @submission.id
      post :create, params: {research: {body: "Here is a body!", age: "50", gender: "Female", occupation: "Central Hospitality Technician", race: "American Indian or Alaska Native", submission_id: @submission.id}}
      expect(assigns(:research)).to eq Research.last
    end
  end

end
