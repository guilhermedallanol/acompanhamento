class PrioritiesController < ApplicationController
  include Resourceless

  private

  def permitted_attributes
    [:name, :category]
  end

  def after_creation_path
    priorities_path
  end
end
