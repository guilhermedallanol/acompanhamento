module Days
  class PerimetersController < BaseController
    include NewCreate

    private

    def permitted_attributes
      [
        :abdomen, :arm, :calf, :chest,
        :hip, :thigh, :waist, :wrist
      ]
    end

    def scope
      day
    end
  end
end
