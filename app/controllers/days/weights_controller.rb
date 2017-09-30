module Days
  class WeightsController < BaseController
    def new
      day
      @weight = Weight.new
    end

    def create
      result = Weights::CreationService.perform(weight_params, day)

      @weight = result.weight

      if result.success?
        redirect_to new_perimeter_path, notice: t(".success")
      else
        render :new
      end
    end

    private

    def weight_params
      params.require(:weight).permit(:value)
    end
  end
end
