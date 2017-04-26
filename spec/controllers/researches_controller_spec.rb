require 'rails_helper'

RSpec.describe ResearchesController, type: :controller do

  describe '#create' do
    it 'works' do
      researches_controller = ResearchesController.new
      result = researches_controller.create
      expect(result).not_to be_nil
    end
  end

end
