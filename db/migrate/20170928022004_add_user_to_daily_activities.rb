class AddUserToDailyActivities < ActiveRecord::Migration[5.1]
  def change
    add_reference :daily_activities, :day, foreign_key: true
  end
end
