class AnecdotesController < ApplicationController

  def create
    anecdote = params[:anecdote]
    submission = Submission.find_by_cookie(cookies[:cc]).id
    @anecdote  = Anecdote.create(body: anecdote, submission_id: submission)
    @anecdote.save!
  end

end
