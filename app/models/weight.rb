class Weight < ApplicationRecord
  validates :value, presence: true

  belongs_to :day

  delegate :registered_on, to: :day
end
