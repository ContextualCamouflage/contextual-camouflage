class InstallationsController < ApplicationController
  def index
    @installations = Installation.all
  end

  def show
    @installation = Installation.find_by_id(params[:id])
    @submissions = @installation.submissions
    @illnesses = Illness.all
  end

end
