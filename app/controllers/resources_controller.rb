class ResourcesController < ApplicationController
  def index
    @resources = Illness.all
  end

  def show
    @resource = Illness.find_by_id(params[:id])
    @anecdotes = Anecdote.includes(:submission).where(submissions: {illness_id: @resource.id}).order(Arel.sql("RANDOM()")).first(5)
  end
end
