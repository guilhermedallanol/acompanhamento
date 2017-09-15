class WeightsController < ApplicationController
  def index
    @weights ||= current_user.weights.decorate
  end

  def destroy
    weight.destroy
    redirect_to weights_path, notice: t('.success')
  end

  private

  def weight
    @weight ||= current_user.weights.find(params[:id])
  end
end
