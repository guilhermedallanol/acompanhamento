class AddUserToPerimeters < ActiveRecord::Migration[5.1]
  def change
    add_reference :perimeters, :day, foreign_key: true
  end
end
