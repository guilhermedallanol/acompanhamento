class Priority < ApplicationRecord
  validates :name, presence: true

  belongs_to :user

  enum category: %i{ essential desirable very_desirable }
end
