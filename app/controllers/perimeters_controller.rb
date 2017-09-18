class PerimetersController < ApplicationController
  def index
    @perimeters ||= current_user.perimeters.decorate
  end
end
