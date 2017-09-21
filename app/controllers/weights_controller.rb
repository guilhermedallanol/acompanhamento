class WeightsController < ApplicationController
  include Resourceless

  private

  def permitted_attributes
    [:registered_on, :value]
  end
end
