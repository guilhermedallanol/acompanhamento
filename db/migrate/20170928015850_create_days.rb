class CreateDays < ActiveRecord::Migration[5.1]
  def change
    create_table :days do |t|
      t.references :user, foreign_key: true
      t.date :registered_on
      t.references :weight, foreign_key: true
      t.references :perimeter, foreign_key: true
      t.references :daily_activity, foreign_key: true
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
