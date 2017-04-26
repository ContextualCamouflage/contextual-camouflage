require 'rails_helper'

RSpec.describe AnecdotesController, type: :controller do

  describe '#index' do
    it 'works' do
      anecdotes_controller = AnecdotesController.new
      result = anecdotes_controller.index
      expect(result).not_to be_nil
    end
  end


  describe '#create' do
    it 'works' do
      anecdotes_controller = AnecdotesController.new
      result = anecdotes_controller.create
      expect(result).not_to be_nil
    end
  end


  describe '#random' do
    it 'works' do
      anecdotes_controller = AnecdotesController.new
      result = anecdotes_controller.random
      expect(result).not_to be_nil
    end
  end

end
