require 'rails_helper'

RSpec.describe IllnessesController, type: :controller do

  describe '#index' do
    it 'works' do
      illnesses_controller = IllnessesController.new
      result = illnesses_controller.index
      expect(result).not_to be_nil
    end
  end


  describe '#show' do
    it 'works' do
      illnesses_controller = IllnessesController.new
      result = illnesses_controller.show
      expect(result).not_to be_nil
    end
  end

end
