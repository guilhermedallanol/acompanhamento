class Perimeter < ApplicationRecord
  validates :abdomen, :arm, :calf, :chest, :hip,
            :registered_on, :thigh, :waist, :wrist,
            presence: true

  belongs_to :user
end
