class DaysController < ApplicationController
  def new
    @day = Day.new
  end

  def create
    result = Days::CreationService.perform(day_params, current_user)

    @day = result.day

    if result.success?
      redirect_to new_daily_activity_path(@day), notice: t(".success")
    else
      render :new
    end
  end

  private

  def day_params
    params.require(:day).permit(:registered_on)
  end
end
