class SubmissionsController < ApplicationController
  def index
    illness_counts = count_by_illness(params[:city])
    render json: illness_counts.to_json, status: 200
  end

  def create
    @submission = Submission.create(submission_params)
  end

  private
  def submission_params
    params.require(:submission).permit(:cookie, :illness, :relationship, :ip_address, :city)
  end

  def count_by_illness(city)
    Submission.where(city: city).group("illness").count
  end
end
