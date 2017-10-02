class HungersController < ApplicationController
  include Resourceless

  private

  def permitted_attributes
    [
      :local, :question, :registered_at, :sensation, :classification
    ]
  end

  def after_creation_path
    hungers_path
  end
end
