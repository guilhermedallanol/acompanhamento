class DailyActivitiesController < ApplicationController
  include Resourceless

  private

  def permitted_attributes
    [
      :activity_1, :activity_2, :activity_3, :activity_4, :activity_5,
      :activity_6, :activity_7, :activity_8, :activity_9, :activity_10,
      :activity_11, :registered_on
    ]
  end
end
