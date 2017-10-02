class RemoveUserFromWeights < ActiveRecord::Migration[5.1]
  def change
    remove_reference :weights, :user, foreign_key: true
  end
end
