class CreateDailyActivities < ActiveRecord::Migration[5.1]
  def change
    create_table :daily_activities do |t|
      t.references :user, foreign_key: true
      t.date :registered_on
      t.boolean :activity_1, null: false, default: false
      t.boolean :activity_2, null: false, default: false
      t.boolean :activity_3, null: false, default: false
      t.boolean :activity_4, null: false, default: false
      t.boolean :activity_5, null: false, default: false
      t.boolean :activity_6, null: false, default: false
      t.boolean :activity_7, null: false, default: false
      t.boolean :activity_8, null: false, default: false
      t.boolean :activity_9, null: false, default: false
      t.boolean :activity_10, null: false, default: false
      t.boolean :activity_11, null: false, default: false

      t.timestamps
    end
  end
end
