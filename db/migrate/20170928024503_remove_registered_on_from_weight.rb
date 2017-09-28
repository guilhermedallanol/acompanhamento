class RemoveRegisteredOnFromWeight < ActiveRecord::Migration[5.1]
  def change
    remove_column :weights, :registered_on, :date
  end
end
