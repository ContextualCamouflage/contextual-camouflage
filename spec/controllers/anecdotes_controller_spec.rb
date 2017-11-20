require 'rails_helper'

RSpec.describe AnecdotesController, type: :controller do

  before do
    FactoryGirl.create(:installation)
    illness = FactoryGirl.create(:illness)
    @submission = FactoryGirl.create(:submission, illness_id: illness.id)
    @anecdote = FactoryGirl.create(:anecdote, submission_id: @submission.id)
  end

  describe '#create' do
    it 'works' do
      @request.cookies['cc'] = @submission.cookie
      post :create, params: {anecdote: {body: "Here is a body!", submission_id: @submission.id}}
      expect(assigns(:anecdote)).to eq Anecdote.last
    end
  end

end
