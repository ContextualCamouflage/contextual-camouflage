class InstallationsController < ApplicationController
  def index
    @installations = Installation.all
  end

  def show
    @installation = Installation.find_by_id(params[:id])
  end

end
