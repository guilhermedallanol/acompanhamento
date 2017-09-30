module Days
  class PerimetersController < BaseController
    def new
      day
      @perimeter = Perimeter.new
    end

    def create
      result = Perimeters::CreationService.perform(perimeter_params, day)

      @perimeter = result.perimeter

      if result.success?
        redirect_to root_path, notice: t(".success")
      else
        render :new
      end
    end

    private

    def perimeter_params
      params.require(:perimeter).permit(
        :abdomen, :arm, :calf, :chest,
        :hip, :thigh, :waist, :wrist
      )
    end
  end
end
