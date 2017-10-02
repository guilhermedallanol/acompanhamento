class WeightsController < ApplicationController
  def index
    @weights = current_user.weights.decorate
  end
end
