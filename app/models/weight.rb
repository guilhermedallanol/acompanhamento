class Weight < ApplicationRecord
  validates :value, presence: true

  belongs_to :user
end
