require 'rails_helper'

RSpec.describe InstallationsController, type: :controller do

  before do
    @installation = FactoryGirl.create(:installation)
  end

  describe '#index' do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe '#show' do
    it "returns http success" do
      get :show, params: { id: @installation.id }
      expect(response).to have_http_status(:success)
    end

    it "renders the #show view" do
      get :show, params: { id: @installation.id }
      expect(response).to have_http_status(:success)
    end

    it "renders the #show view" do
      get :show, params: { id: @installation.id }
      expect(response).to render_template :show
    end

    it "assigns illness to @illness" do
      get :show, params: { id: @installation.id }
      expect(assigns(:installation)).to eq(@installation)
    end
  end

end
