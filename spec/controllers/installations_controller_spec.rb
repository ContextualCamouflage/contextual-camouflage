require 'rails_helper'

RSpec.describe InstallationsController, type: :controller do

  describe '#index' do
    it 'works' do
      installations_controller = InstallationsController.new
      result = installations_controller.index
      expect(result).not_to be_nil
    end
  end

  describe '#show' do
    it 'works' do
      installations_controller = InstallationsController.new
      result = installations_controller.show
      expect(result).not_to be_nil
    end
  end

end
