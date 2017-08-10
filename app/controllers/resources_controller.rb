class ResourcesController < ApplicationController
  def index
    @resources = Illness.all
  end

  def show
    @resource = Illness.find_by_id(params[:id])
    @anecdotes = Anecdote.all.includes(:submission).where(submissions: {illness_id: params[:id]}).order("RANDOM()")
    # @anecdote = Anecdote.includes(:submission).where(submissions: {illness_id: @resource.id}).order("RANDOM()").first
  end
end
