class AddRegisteredOnToWeights < ActiveRecord::Migration[5.1]
  def change
    add_column :weights, :registered_on, :date
  end
end
