class RemoveRegisteredOnFromDailyActivities < ActiveRecord::Migration[5.1]
  def change
    remove_column :daily_activities, :registered_on, :date
  end
end
