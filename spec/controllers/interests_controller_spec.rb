require 'rails_helper'

RSpec.describe InterestsController, type: :controller do

  describe '#create' do
    it 'works' do
      expect{
        post :create, params: {interest: {topic: 'Host', email: 'mail@example.com'}}
      }.to change(Interest, :count)
    end
  end

end