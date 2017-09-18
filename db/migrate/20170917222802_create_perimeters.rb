class CreatePerimeters < ActiveRecord::Migration[5.1]
  def change
    create_table :perimeters do |t|
      t.references :user, foreign_key: true
      t.integer :wrist
      t.integer :arm
      t.integer :chest
      t.integer :waist
      t.integer :abdomen
      t.integer :hip
      t.integer :thigh
      t.integer :calf
      t.date :registered_on

      t.timestamps
    end
  end
end
