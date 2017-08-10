require 'rails_helper'

RSpec.describe ResourcesController, type: :controller do

  before do
    @illness = FactoryGirl.create(:illness)
    installation = FactoryGirl.create(:installation, locality: "Oakland")
    submission = FactoryGirl.create(:submission, illness_id: @illness.id, locality: installation.locality)
    @anecdote = FactoryGirl.create(:anecdote, submission_id: submission.id)
  end

  describe '#index' do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe '#show' do
    it "returns http success" do
      get :show, params: { id: @illness.id }
      expect(response).to have_http_status(:success)
    end

    it "renders the #show view" do
      get :show, params: { id: @illness.id }
      expect(response).to have_http_status(:success)
    end

    it "renders the #show view" do
      get :show, params: { id: @illness.id }
      expect(response).to render_template :show
    end

    it "assigns illness to @resource" do
      get :show, params: { id: @illness.id }
      expect(assigns(:installation)).to eq(@resource)
    end

    it "assigns anecdote to @anecdote" do
      get :show, params: { id: @illness.id }
      expect(assigns(:anecdote)).to eq(@anecdotes)
    end
  end

end
