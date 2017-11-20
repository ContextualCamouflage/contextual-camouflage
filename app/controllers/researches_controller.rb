class ResearchesController < ApplicationController

  def create
    final_params = research_params.merge({:submission_id => Submission.find_by_cookie(cookies[:cc]).id})
    @research = Research.create(final_params)
    @research.save!
  end

  private

  def research_params
    params.require(:research).permit(:age, :gender, :occupation, :race, :submission_id)
  end
end
