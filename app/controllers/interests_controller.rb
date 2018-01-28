class InterestsController < ApplicationController

  def create
    Interest.create!(interest_params)
    redirect_back(fallback_location: root_path)
  end

  private

  def interest_params
    params.require(:interest).permit(:email, :topic)
  end
end
