class DailyActivity < ApplicationRecord
  belongs_to :day

  delegate :registered_on, to: :day
end
