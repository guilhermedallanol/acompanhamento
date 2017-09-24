class PrioritiesController < ApplicationController
  include Resourceless

  private

  def permitted_attributes
    [:name, :category]
  end
end
