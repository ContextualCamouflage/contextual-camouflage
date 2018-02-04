class InstallationsController < ApplicationController
  def index
    @installations = Installation.all
  end

  def show
    @installation = Installation.find_by_id(params[:id])
    @submissions = @installation.submissions
    @illnesses = Illness.all
  end

  def main
    @installation = Installation.find_by_id(params[:id])
    @submissions = @installation.submissions
    @illnesses = Illness.all
    @anecdotes = Anecdote.includes(:submission).order("RANDOM()").first(5)
  end

end
