module Days
  class WeightsController < BaseController
    include NewCreate

    private

    def permitted_attributes
      [:value]
    end

    def after_creation_path
      new_perimeter_path(@day)
    end

    def scope
      day
    end
  end
end
