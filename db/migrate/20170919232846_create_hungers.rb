class CreateHungers < ActiveRecord::Migration[5.1]
  def change
    create_table :hungers do |t|
      t.references :user, foreign_key: true
      t.datetime :registered_at
      t.string :local
      t.string :sensation
      t.string :question
      t.integer :classification

      t.timestamps
    end
  end
end
