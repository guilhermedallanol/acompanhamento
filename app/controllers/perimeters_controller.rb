class PerimetersController < ApplicationController
  def index
    @perimeters ||= current_user.perimeters.decorate
  end

  def destroy
    perimeter.destroy
    redirect_to perimeters_path, notice: t('.success')
  end

  private

  def perimeter
    @perimeter ||= current_user.perimeters.find(params[:id])
  end
end
