class Hunger < ApplicationRecord
  validates :local, :question, :registered_at, :sensation,
            presence: true

  belongs_to :user

  enum classification: %i{ hunger desire crave }
end
