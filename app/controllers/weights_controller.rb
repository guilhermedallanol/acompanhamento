class WeightsController < ApplicationController
  def index
    @weights ||= current_user.weights.decorate
  end

  def new
    @weight = Weight.new
  end

  def create
    result = Weights::CreationService.perform(weight_params, current_user)

    @weight = result.weight

    if result.success?
      redirect_to weights_path, notice: t(".success")
    else
      render :new
    end
  end

  def destroy
    weight.destroy
    redirect_to weights_path, notice: t('.success')
  end

  private

  def weight
    @weight ||= current_user.weights.find(params[:id])
  end

  def weight_params
    params.require(:weight).permit(:registered_on, :value)
  end
end
