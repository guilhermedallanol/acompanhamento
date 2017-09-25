class CreatePriorities < ActiveRecord::Migration[5.1]
  def change
    create_table :priorities do |t|
      t.references :user, foreign_key: true
      t.integer :category
      t.string :name

      t.timestamps
    end
  end
end
