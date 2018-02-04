class InterestsController < ApplicationController

  def create
    begin
      Interest.create!(interest_params)
    rescue ActiveRecord::RecordInvalid => e
      head :ok if e.message == 'Validation failed: Email has already been taken'
    end
    head :ok
  end

  private

  def interest_params
    params.require(:interest).permit(:email, :topic)
  end
end
