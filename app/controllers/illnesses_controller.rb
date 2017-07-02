class IllnessesController < ApplicationController

  def index
    @illnesses = Illness.all
    render json: @illnesses.to_json, status: 200
  end

  def show
    @illness = Illness.find_by_id(params[:id])
  end

  protected

  def illness_params
    params.require(:illness).permit(:name, :body)
  end

end
