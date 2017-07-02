class ResearchesController < ApplicationController

  def create
    @research = Research.create(research_params)
  end

  private

  def research_params
    params.require(:research).permit(:age, :gender, :occupation, :race, :submission_id)
  end
end
