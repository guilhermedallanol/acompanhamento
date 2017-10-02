class DailyActivitiesController < ApplicationController
  def index
    @daily_activities = current_user.daily_activities.decorate
  end
end
