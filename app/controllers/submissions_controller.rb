class SubmissionsController < ApplicationController
  def index
    illness_counts = count_by_illness(params[:city])
    render json: illness_counts.to_json, status: 200
  end

  def create
    @submission = Submission.create(submission_params)
    @submission.ip_address = request.remote_ip
    @submission.geocode_location
    @submission.cookie = session['session_id']
    if @submission.save
      ActionCable.server.broadcast 'map_channel',
                                   id: @submission.id, latitude: @submission.latitude, longitude: @submission.longitude, illness_id: @submission.illness_id
    else
      redirect_to @submission.installation
    end
  end

  private

  def submission_params
    params.require(:submission).permit(:relationship, :ip_address, :illness_id, :locality)
  end

  def count_by_illness(city)
    Submission.where(city: city).group("illness").count
  end
end
