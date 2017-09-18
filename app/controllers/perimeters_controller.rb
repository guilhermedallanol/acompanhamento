class PerimetersController < ApplicationController
  def index
    @perimeters ||= current_user.perimeters.decorate
  end

  def new
    @perimeter = Perimeter.new
  end

  def create
    result = Perimeters::CreationService.perform(perimeter_params, current_user)

    @perimeter = result.perimeter

    if result.success?
      redirect_to perimeters_path, notice: t(".success")
    else
      render :new
    end
  end

  def destroy
    perimeter.destroy
    redirect_to perimeters_path, notice: t('.success')
  end

  private

  def perimeter
    @perimeter ||= current_user.perimeters.find(params[:id])
  end

  def perimeter_params
    params.require(:perimeter).permit(
      :abdomen, :arm, :calf, :chest, :hip,
      :registered_on, :thigh, :waist, :wrist
    )
  end
end
