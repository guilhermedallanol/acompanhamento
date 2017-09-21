class PerimetersController < ApplicationController
  include Resourceless

  private

  def permitted_attributes
    [
      :abdomen, :arm, :calf, :chest, :hip,
      :registered_on, :thigh, :waist, :wrist
    ]
  end
end
