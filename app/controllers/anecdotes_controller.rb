class AnecdotesController < ApplicationController

  def create
    anecdote = anecdote_params[:anecdote]
    submission = Submission.find_by_id(session[:id]).id
    @anecdote  = Anecdote.create(body: anecdote, submission_id: submission)
    @anecdote.save
  end

  private

  def anecdote_params
    params.permit(:anecdote)
  end

end
