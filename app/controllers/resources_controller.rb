class ResourcesController < ApplicationController
  def index
    @resources = Illness.all
  end

  def show
    @resource = find_all_resources(params[:id])
    # TODO @brittany this probably needs a test
    @anecdotes = Anecdote.all.includes(:submission).where(submissions: {illness_id: @resource.id}).order("RANDOM()")
    # @anecdote = Anecdote.includes(:submission).where(submissions: {illness_id: @resource.id}).order("RANDOM()").first
  end

  def find_all_resources(id)
    @resource ||= Illness.find_by_id(id)
  end
end
