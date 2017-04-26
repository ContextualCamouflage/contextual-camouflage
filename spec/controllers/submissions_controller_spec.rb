require 'rails_helper'

RSpec.describe SubmissionsController, type: :controller do

  describe '#index' do
    it 'works' do
      submissions_controller = SubmissionsController.new
      result = submissions_controller.index
      expect(result).not_to be_nil
    end
  end

  describe '#create' do
    it 'works' do
      submissions_controller = SubmissionsController.new
      result = submissions_controller.create
      expect(result).not_to be_nil
    end
  end

end
