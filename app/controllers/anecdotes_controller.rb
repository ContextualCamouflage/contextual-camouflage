class AnecdotesController < ApplicationController

  def index
  end

  def create
    @anecdote  = Anecdote.create(anecdote_params)
  end

  def random
    random = Anecdote.all.includes(:submission).where(submissions: {illness: params[:illness]}).sample
    render json: random.to_json, status: 200
  end

private
  def anecdote_params
    params.require(:anecdote).permit(:body, :cookie)
  end
end
