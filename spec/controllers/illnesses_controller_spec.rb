require 'rails_helper'

RSpec.describe IllnessesController, type: :controller do

  before do
    @illness = FactoryBot.create(:illness)
  end

  describe '#index' do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(200)
    end
  end

  describe '#show' do
    it "returns http success" do
      get :show, params: { id: @illness.id }
      expect(response).to have_http_status(200)
    end

    it "renders the #show view" do
      get :show, params: { id: @illness.id }
      expect(response).to have_http_status(200)
    end

    it "renders the #show view" do
      get :show, params: { id: @illness.id }
      expect(response).to render_template :show
    end

    it "assigns illness to @illness" do
      get :show, params: { id: @illness.id }
      expect(assigns(:illness)).to eq(@illness)
    end
  end

end
