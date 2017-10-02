class Perimeter < ApplicationRecord
  validates :abdomen, :arm, :calf, :chest,
            :hip, :thigh, :waist, :wrist,
            presence: true

  belongs_to :day

  delegate :registered_on, to: :day
end
