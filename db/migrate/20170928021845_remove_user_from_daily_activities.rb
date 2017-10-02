class RemoveUserFromDailyActivities < ActiveRecord::Migration[5.1]
  def change
    remove_reference :daily_activities, :user, foreign_key: true
  end
end
