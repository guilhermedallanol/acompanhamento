class Weight < ApplicationRecord
  validates :registered_on, :value, presence: true

  belongs_to :user
end
