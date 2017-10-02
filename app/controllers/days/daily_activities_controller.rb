module Days
  class DailyActivitiesController < BaseController
    def new
      day
      @daily_activity = DailyActivity.new
    end

    def create
      result = DailyActivities::CreationService.perform(activity_params, day)

      @daily_activity = result.daily_activity

      redirect_to new_weight_path(@day), notice: t(".success")
    end

    private

    def activity_params
      params.require(:daily_activity).permit(
        :activity_1, :activity_2, :activity_3, :activity_4, :activity_5,
        :activity_6, :activity_7, :activity_8, :activity_9, :activity_10,
        :activity_11
      )
    end
  end
end
