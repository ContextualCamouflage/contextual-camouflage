class AnecdotesController < ApplicationController

  def create
    #TODO: why am I getting an array from the Frontend? Can this be a string field?
    #I'd like to remove the .first on the next line
    anecdote = params[:anecdote].first
    submission = Submission.find_by_cookie(cookies[:cc]).id
    @anecdote  = Anecdote.create(body: anecdote, submission_id: submission)
    @anecdote.save!
  end

end
