class RemoveRegisteredOnFromPerimeter < ActiveRecord::Migration[5.1]
  def change
    remove_column :perimeters, :registered_on, :date
  end
end
