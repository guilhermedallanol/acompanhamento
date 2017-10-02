class AddUserToWeights < ActiveRecord::Migration[5.1]
  def change
    add_reference :weights, :day, foreign_key: true
  end
end
